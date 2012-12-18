/*
 * TinyUmbrella - making iDevice restores possible...
 * Copyright (C) 2009-2010 semaphore
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.semaphore.jna.img3;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.logging.Logger;

/**
 * Brought to you by:
 * User: semaphore
 * Date: May 27, 2010
 * Time: 9:08:53 PM
 */
public class Img3Reader {
    private Logger log = Logger.getLogger("Img3Reader");
    private ByteBuffer buffer;

    public Img3Reader(String data) {
        buffer = ByteBuffer.wrap(data.getBytes());
        buffer.order(ByteOrder.nativeOrder());
    }

    public Img3Reader(ByteBuffer data) {
        buffer = data;
    }

    public void replaceSignature(Img3File file, Img3Reader data) {
        Img3Element ecid = data.readImg3Element();
        Img3Element shsh = data.readImg3Element();
        Img3Element cert = data.readImg3Element();
        file.ecid_element = ecid;
        file.shsh_element = shsh;
        file.cert_element = cert;
    }

    public Img3Header readImg3Header() {
        Img3Header hdr = new Img3Header();
        hdr.signature = Img3Container.getType(buffer.getInt());
        hdr.full_size = buffer.getInt();
        hdr.data_size = buffer.getInt();
        hdr.shsh_offset = buffer.getInt();
        hdr.image_type = buffer.getInt();
        return hdr;
    }

    public Img3ElementHeader readImg3ElementHeader() {
        return readImg3ElementHeader(buffer);
    }

    public Img3ElementHeader readImg3ElementHeader(ByteBuffer buffer) {
        Img3ElementHeader hdr = new Img3ElementHeader();
        hdr.signature = Img3ElementType.getType(buffer.getInt());
        hdr.full_size = buffer.getInt();
        hdr.data_size = buffer.getInt();
        return hdr;
    }

    public Img3Element readImg3Element() {
        Img3Element element = new Img3Element();
        Img3ElementHeader hdr = readImg3ElementHeader();
        byte[] dst = new byte[hdr.full_size];
        buffer.get(dst);
        element.data = ByteBuffer.wrap(dst).order(ByteOrder.nativeOrder());
        element.header = readImg3ElementHeader(element.data);
        element.type = hdr.signature;
        return element;
    }

    public Img3File readImg3File() {
        Img3File file = new Img3File();
        file.header = readImg3Header();
        if (file.header.signature != Img3Container.kImg3Container)
            return null;
        while (buffer.remaining() > 0) {
            Img3ElementHeader current = readImg3ElementHeader();
            switch (current.signature) {
                case kTypeElement:
                    file.type_element = readImg3Element();
                    log.info("Parsed TYPE Element.");
                    break;
                case kDataElement:
                    file.data_element = readImg3Element();
                    log.info("Parsed DATA Element.");
                    break;
                case kVersElement:
                    file.vers_element = readImg3Element();
                    log.info("Parsed VERS Element.");
                    break;
                case kSepoElement:
                    file.sepo_element = readImg3Element();
                    log.info("Parsed SEPO Element.");
                    break;
                case kBordElement:
                    file.bord_element = readImg3Element();
                    log.info("Parsed BORD Element.");
                    break;
                case kKbagElement:
                    if (file.kbag1_element == null) {
                        file.kbag1_element = readImg3Element();
                        log.info("Parsed KBAG1 Element.");
                    } else {
                        file.kbag2_element = readImg3Element();
                        log.info("Parsed KBAG2 Element.");
                    }
                    break;
                case kEcidElement:
                    file.ecid_element = readImg3Element();
                    log.info("Parsed ECID Element.");
                    break;
                case kShshElement:
                    file.shsh_element = readImg3Element();
                    log.info("Parsed SHSH Element.");
                    break;
                case kCertElement:
                    file.cert_element = readImg3Element();
                    log.info("Parsed CERT Element.");
                    break;
            }
        }
        return file;
    }

    /*
    img3_file* img3_parse_file(char* data, int size);
    img3_element* img3_parse_element(char* data);
    int img3_replace_signature(img3_file* image, char* signature);
    void img3_free(img3_file* image);
    int img3_get_data(img3_file* image, char** pdata, int* psize);
    void img3_free_element(img3_element* element);
    */
}

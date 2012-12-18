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

package com.semaphore.util;

import com.semaphore.util.plist.JPlistBuilder;
import com.semaphore.util.plist.PList;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * Brought to you by:
 * User: semaphore
 * Date: Jul 1, 2010
 * Time: 9:04:25 AM
 */
public class KeyUtil {
    private static PublicKey pubKey;

    private static SecretKeySpec aesKey;

    private static BASE64Encoder encoder = new BASE64Encoder();
    private static BASE64Decoder decoder = new BASE64Decoder();

    static {
        PList encryptionKeyPList = JPlistBuilder.buildPList(StringUtil.class.getResourceAsStream("/com/semaphore/data/key.plist"));
        pubKey = deserializePublicKey(encryptionKeyPList.get("PubKey").asData().replaceAll("\\s*", ""));
        try {
            KeyGenerator kgen = KeyGenerator.getInstance("AES");
            kgen.init(128); // 192 and 256 bits may not be available
            SecretKey skey = kgen.generateKey();
            byte[] raw = skey.getEncoded();
            aesKey = new SecretKeySpec(raw, "AES");
        } catch (Exception ignored) {
        }
    }

    private static final String PROVIDER = "RSA";
    private static final int CHUNK = 256;

    private static byte[] encrypt(byte[] inpBytes) throws Exception {
        Cipher cipher = Cipher.getInstance(PROVIDER);
        cipher.init(Cipher.ENCRYPT_MODE, pubKey);
        return cipher.doFinal(inpBytes);
    }

    public static String decrypt(String message, SecretKeySpec key) {
        try {
            if (key == null)
                key = aesKey;
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.DECRYPT_MODE, key);
            message = new String(decoder.decodeBuffer(message), "ISO-8859-1");
            return new String(cipher.doFinal(message.getBytes("ISO-8859-1")), "ISO-8859-1");
        } catch (Exception ignored) {
        }
        return "";
    }

    public static String encrypt(String message) {
        try {
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE, aesKey);
            return encoder.encode(cipher.doFinal(message.getBytes("ISO-8859-1")));
        } catch (Exception ignored) {
        }
        return "";
    }

    public static String encryptKey() {
        try {
            byte[] enc = encrypt(aesKey.getEncoded());
            return encoder.encode(enc);
        } catch (Exception ignored) {
        }
        return "";
    }

    public static SecretKeySpec decryptKey(String key, PrivateKey pkey) {
        try {
            key = new String(decoder.decodeBuffer(key), "ISO-8859-1");
            return new SecretKeySpec(decrypt(key.getBytes("ISO-8859-1"), pkey), "AES");
        } catch (Exception ignored) {
        }
        return null;
    }


    public static String olddecrypt(String message, PrivateKey key) {
        StringBuilder sb = new StringBuilder();
        try {
            BASE64Decoder dec = new BASE64Decoder();
            String nmsg = new String(dec.decodeBuffer(message));
            ByteBuffer buffer = ByteBuffer.allocate(nmsg.length());
            if (nmsg.length() > CHUNK) {
                String[] splits = nmsg.split("\0[\r]?\n[\r]?\n\0");
                for (String split : splits) {
                    buffer.put(decrypt(split.getBytes(), key));
                }
                String str = new String(buffer.array());
                sb.append(str);
            } else {
                String str = new String(decrypt(nmsg.getBytes(), key));
                sb.append(str);
            }

            return sb.toString().trim();
        } catch (Exception ignored) {
            ignored.printStackTrace();
            return "";
        }
    }

    public static String oldencrypt(String message) {
        try {
            BASE64Encoder enc = new BASE64Encoder();
            StringBuilder sb = new StringBuilder();
            if (message.length() > CHUNK) {
                ByteBuffer buffer = ByteBuffer.allocate(message.length());
                int iters = message.length() / CHUNK;
                int rem = message.length() % CHUNK;
                buffer.put(message.getBytes());
                byte[] dst = new byte[CHUNK];
                buffer.position(0);
                while (iters-- > 0) {
                    buffer.get(dst, 0, CHUNK);
                    String str = new String(encrypt(dst));
                    sb.append(str).append("\0\n\n\0");
                }
                dst = new byte[rem];
                buffer.get(dst, 0, rem);
                String str = new String(encrypt(dst));
                sb.append(str);
            } else {
                sb.append(encrypt(message.getBytes()));
            }
            String sbb = sb.toString();
            return enc.encode(sbb.getBytes());
        } catch (Exception ignored) {
            ignored.printStackTrace();
            return "";
        }
    }

    private static String chop(String value, int limit, int level, String indentString) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < value.length(); i += limit) {
            if (i + limit < value.length() || value.length() > limit) {
                if (sb.length() > 0)
                    sb.append(doIndent(level, indentString));
            }
            if (i + limit > value.length())
                sb.append(value.substring(i));
            else
                sb.append(value.substring(i, i + limit));
        }
        return sb.toString();
    }

    private static String doIndent(int level, String indentString) {
        StringBuilder sb = new StringBuilder(level * indentString.length() * level);
        sb.append("\0\0\0");
        while (level-- > 0)
            sb.append(indentString);
        return sb.toString();
    }

    public static byte[] decrypt(byte[] inpBytes, PrivateKey key) throws Exception {
        Cipher cipher = Cipher.getInstance(PROVIDER);
        cipher.init(Cipher.DECRYPT_MODE, key);
        return cipher.doFinal(inpBytes);
    }

    public static PublicKey deserializePublicKey(String s) {
        try {
            byte abyte0[] = stringToBytes(s);
            X509EncodedKeySpec x509encodedkeyspec = new X509EncodedKeySpec(abyte0);
            KeyFactory keyfactory = KeyFactory.getInstance(PROVIDER);
            return keyfactory.generatePublic(x509encodedkeyspec);
        }
        catch (Exception exception) {
            throw new RuntimeException(exception);
        }
    }

    public static PrivateKey deserializePrivateKey(String s) throws IOException {
        try {
            byte abyte0[] = stringToBytes(s);
            PKCS8EncodedKeySpec pkcs8encodedkeyspec = new PKCS8EncodedKeySpec(abyte0);
            KeyFactory keyfactory = KeyFactory.getInstance(PROVIDER);
            return keyfactory.generatePrivate(pkcs8encodedkeyspec);
        }
        catch (Exception exception) {
            throw new RuntimeException(exception);
        }
    }


    private static byte[] stringToBytes(String s) throws Exception {
        return new BASE64Decoder().decodeBuffer(s);
    }
}

/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.ide.blame.command;

import jetbrains.mps.ide.blame.perform.Query;
import jetbrains.mps.ide.blame.perform.Response;
import junit.framework.TestCase;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;

import java.io.IOException;
import java.io.InterruptedIOException;

public class YouTrackURLTest extends TestCase {
  public void testLogin() throws IOException {
    HttpClient client = new HttpClient();
    Poster.setTimeouts(client);
    Response result = null;
    IOException lastEx = null;
    for (int i=1; i<=3; ++i) {
      lastEx = null;
      try {
        result = Command.login(client, Query.ANONYMOUS);
        if (!result.isSuccess()) {
          try {
            Thread.sleep(3000*i);
          }
          catch (InterruptedException ignore) {}
        }
        else {
          break;
        }
      }
      catch (HttpException ex) {
        lastEx = ex;
      }
      catch (InterruptedIOException ex) {
        lastEx = ex;
      }
    }
    if (lastEx != null) {
      throw lastEx;
    }
    assertTrue("Can't login to YouTrack as anonymous", result.isSuccess());
  }
}

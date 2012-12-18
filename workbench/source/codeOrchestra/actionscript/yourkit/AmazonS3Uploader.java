package codeOrchestra.actionscript.yourkit;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.s3.model.ProgressEvent;
import com.amazonaws.services.s3.model.ProgressListener;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;
import com.amazonaws.util.StringInputStream;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import org.jetbrains.annotations.NotNull;

import javax.swing.JOptionPane;
import java.io.File;
import java.io.IOException;

/**
 * @author Anton.I.Neverov
 */
public class AmazonS3Uploader {

  private final static AmazonS3Uploader INSTANCE = new AmazonS3Uploader();

  private final static String CREDENTIALS_STRING = "accessKey = AKIAJECGCTS6DVP3JRRQ\n" +
    "secretKey = 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";
  private final static String BUCKET_NAME = "coolide-storage";

  private TransferManager tx;
  private Upload upload;

  private AmazonS3Uploader() {
    try {
      AWSCredentials credentials = new PropertiesCredentials(new StringInputStream(CREDENTIALS_STRING));

      // TransferManager manages a pool of threads, so we create a
      // single instance and share it throughout our application.
      tx = new TransferManager(credentials);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public static AmazonS3Uploader getInstance() {
    return INSTANCE;
  }

  public void uploadFile(final File fileToUpload) {

    ProgressManager.getInstance().run(new Task.Modal(null, "Uploading...", false) {
      public void run(@NotNull final ProgressIndicator p0) {

        ProgressListener progressListener = new ProgressListener() {
          public void progressChanged(ProgressEvent progressEvent) {
            if (upload == null) return;

            p0.setFraction(upload.getProgress().getPercentTransfered() / 100);

            switch (progressEvent.getEventCode()) {
              case ProgressEvent.COMPLETED_EVENT_CODE:
                p0.setFraction(1);
                break;
              case ProgressEvent.FAILED_EVENT_CODE:
                try {
                  AmazonClientException e = upload.waitForException();
                  JOptionPane.showMessageDialog(JOptionPane.getRootFrame(),
                    "Unable to upload file to Amazon S3: " + e.getMessage(),
                    "Error Uploading File", JOptionPane.ERROR_MESSAGE);
                } catch (InterruptedException e) {
                  e.printStackTrace();
                }
                break;
            }
          }
        };

        PutObjectRequest request = new PutObjectRequest(
          BUCKET_NAME, fileToUpload.getName(), fileToUpload)
          .withProgressListener(progressListener);
        upload = tx.upload(request);

        while (!upload.isDone()) {
          try {
            Thread.sleep(100);
          } catch (InterruptedException e) {
            e.printStackTrace();
          }
        }
    }
    });

  }

}

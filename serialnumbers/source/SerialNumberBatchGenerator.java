import javax.xml.bind.SchemaOutputResolver;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class SerialNumberBatchGenerator {

  private static final String SERIALS_DIR = "/Users/eliseev/TMP/serials/";
  private static final String SERIAL_NUMBERS_SEPARATOR = "\n";

  public static void main(String[] args) {
    // Memorize the time
    long timeStarted = System.currentTimeMillis();

    // Calculate total licenses count
    int totalNumberOfLicenses = SerialNumberBatchType.getTotalLicensesCount();

    // Create the serial numbers
    SerialNumberGenerator serialNumberGenerator = new SerialNumberGenerator();
    List<String> serialNumbers = new ArrayList<String>(serialNumberGenerator.createSerialNumbers(totalNumberOfLicenses));

    // Prepare output dir
    File serialsDirFile = new File(SERIALS_DIR);
    if (!serialsDirFile.exists()) {
      serialsDirFile.mkdirs();
    }

    // Output the serial numbers to the files
    for (SerialNumberBatchType serialNumberBatchType : SerialNumberBatchType.values()) {
      try {
        System.out.println("Generating " + serialNumberBatchType.getLicensesCount() + " licenses of type: " + serialNumberBatchType.getName() + "...");

        // Create file
        FileWriter fstream = new FileWriter(new File(serialsDirFile, serialNumberBatchType.getOutputFileName()));
        BufferedWriter out = new BufferedWriter(fstream);

        // Write the serial files
        for (int i = 0; i < serialNumberBatchType.getLicensesCount(); i++) {
          out.write(serialNumbers.remove(0) + SERIAL_NUMBERS_SEPARATOR);
        }

        // Close the output stream
        out.close();
      } catch (Throwable e) {
        System.err.println("Error : " + e.getMessage());
      }
    }

    System.out.println("Serial numbers generation/write took " + (System.currentTimeMillis() - timeStarted) + "ms");
  }
}



package hotelbooking;

import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.Test;

/**
 * an alternative way to run selected paths, tags and even features using the
 * java api here you don't need to use the KarateOptions annotation and you can
 * dynamically determine the features that need to be executed
 */

public class HotelBookingTest {

    @Test
    public void testSelected() {
        List<String> tags = Arrays.asList("~@ignore");
        List<String> features = Arrays.asList("classpath:hotelbooking/api");
        String karateOutputPath = "target/surefire-reports";
        Results results = Runner.path(features)
                .tags(tags)
                .outputCucumberJson(true)
                .reportDir(karateOutputPath).parallel(5);
        HotelBookingTest.generateReport(karateOutputPath);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {        
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "hotelbooking");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();        
    }

}
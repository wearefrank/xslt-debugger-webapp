package nl.nn.testtool.test.webapp;

import lombok.AllArgsConstructor;
import nl.nn.testtool.TestTool;
import org.wearefrank.xsltdebugger.XSLTReporterSetup;
import org.wearefrank.xsltdebugger.XSLTTraceReporter;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@AllArgsConstructor
public class XsltReportFromFile {
    private TestTool testTool;
    private File xmlFile;
    private File xslFile;
    private int xsltVersion;

    public void createXsltReport(String reportName) throws IOException {
        XSLTReporterSetup xsltReporterSetup = new XSLTReporterSetup(xmlFile, xslFile, xsltVersion);
        xsltReporterSetup.transform();
        XSLTTraceReporter.initiate(testTool, xsltReporterSetup, UUID.randomUUID().toString(), reportName);
    }
}

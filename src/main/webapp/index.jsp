<%@ page import="nl.nn.testtool.test.webapp.XsltReportFromFile" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.File" %>
<%@ page import="nl.nn.testtool.TestTool" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%
    ServletContext servletContext = request.getSession().getServletContext();
    WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
    TestTool testTool = (TestTool) webApplicationContext.getBean("testTool");
    if (request.getParameter("xsltExample1") != null) {
        ClassLoader classLoader = servletContext.getClassLoader();
        URL url = classLoader.getResource("xsltExample1.xml");
        assert url != null;
        File xmlFile = new File(url.getFile());
        url = classLoader.getResource("xsltExample1.xsl");
        assert url != null;
        File xslFile = new File(url.getFile());
        int version = 1;
        boolean isSaxon = request.getParameter("saxon") != null;
        if (isSaxon) version = 2;
        XsltReportFromFile xsltReportFromFile = new XsltReportFromFile(testTool, xmlFile, xslFile, version);
        if (isSaxon) {
            xsltReportFromFile.createXsltReport("Saxon Example Report 1");
        } else {
            xsltReportFromFile.createXsltReport("Xalan Example Report 1");
        }
        response.sendRedirect("/ladybug");
    }
    if (request.getParameter("xsltExample2") != null) {
        ClassLoader classLoader = servletContext.getClassLoader();
        URL url = classLoader.getResource("xsltExample2.xml");
        assert url != null;
        File xmlFile = new File(url.getFile());
        url = classLoader.getResource("xsltExample2.xsl");
        assert url != null;
        File xslFile = new File(url.getFile());
        int version = 1;
        boolean isSaxon = request.getParameter("saxon") != null;
        if (isSaxon) version = 2;
        XsltReportFromFile xsltReportFromFile = new XsltReportFromFile(testTool, xmlFile, xslFile, version);
        if (isSaxon) {
            xsltReportFromFile.createXsltReport("Saxon Example Report 2");
        } else {
            xsltReportFromFile.createXsltReport("Xalan Example Report 2");
        }
        response.sendRedirect("/ladybug");
    }
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<div class="header">
    <h1 class="title-name">XSLT Debugger</h1>
    <div class="vertical-line"></div>
    <div class="links-container">
        <a class="media-link" href="https://github.com/wearefrank/xslt-debugger-webapp" target="_blank">Github</a>
        <a class="media-link" href="https://wearefrank.nl/contact/" target="_blank">Contact</a>
        <a class="media-link" href="index.jsp?xsltExample1&xalan">XALAN Example 1</a>
        <a class="media-link" href="index.jsp?xsltExample1&saxon">SAXON Example 1</a>
        <a class="media-link" href="index.jsp?xsltExample2&xalan">XALAN Example 2</a>
        <a class="media-link" href="index.jsp?xsltExample2&saxon">SAXON Example 2</a>
    </div>
    <svg class="wearefrank-logo" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 264.24 55.23">
        <path d="M36.62 10.26L29 34.15h-6.71l-3.83-12.76-3.82 12.76H8L.31 10.26H8l3.44 12.81 3.73-12.81h6.69l3.73 12.81L29 10.26zM50.72 28.42a6.23 6.23 0 004.58-1.82l5.7 3.3c-2.34 3.25-5.87 4.92-10.41 4.92-8.17 0-13.23-5.5-13.23-12.61A12.25 12.25 0 0150.09 9.59c7 0 12.14 5.4 12.14 12.62a13.94 13.94 0 01-.29 2.86H45c.89 2.49 3.09 3.35 5.72 3.35zm4.39-8.7A4.91 4.91 0 0050.05 16a4.93 4.93 0 00-5.21 3.77z"
              fill="#1e1e1e"></path>
        <path d="M90.51 10.26v23.89h-7.16V31.9a9 9 0 01-7.12 2.92c-6.26 0-11.42-5.5-11.42-12.61S70 9.59 76.23 9.59a9 9 0 017.12 2.92v-2.25zm-7.16 12a5.69 5.69 0 10-11.37 0 5.69 5.69 0 1011.37 0zM110.1 9.78v8.13c-3-.48-7.16.71-7.16 5.44v10.8h-7.17V10.26h7.17v4.25c.95-3.2 4.15-4.73 7.16-4.73zM124.87 28.42a6.22 6.22 0 004.58-1.82l5.74 3.3c-2.34 3.25-5.88 4.92-10.42 4.92-8.17 0-13.23-5.5-13.23-12.61a12.25 12.25 0 0112.71-12.62c7 0 12.13 5.4 12.13 12.62a13.94 13.94 0 01-.28 2.86h-17c.9 2.49 3.14 3.35 5.77 3.35zm4.39-8.7a5.38 5.38 0 00-10.27 0z"
              fill="#fff"></path>
        <path d="M148.42 10.26h4.45v6.88h-4.45v17h-7.16v-17h-3.2v-6.88h3.2c0-6.69 3.68-10.7 11.61-10.22v6.88c-2.68-.24-4.45.57-4.45 3.34zM169.83 9.78v8.13c-3-.48-7.17.71-7.17 5.44v10.8h-7.16V10.26h7.16v4.25c.96-3.2 4.16-4.73 7.17-4.73zM197 10.26v23.89h-7.2V31.9a9 9 0 01-7.12 2.92c-6.26 0-11.42-5.5-11.42-12.61s5.16-12.62 11.42-12.62a9 9 0 017.12 2.92v-2.25zm-7.16 12a5.69 5.69 0 10-11.37 0 5.69 5.69 0 1011.37 0zM225.15 19.48v14.67H218V20.53c0-3-1.87-4.34-4.16-4.34-2.63 0-4.44 1.53-4.44 4.92v13h-7.17V10.26h7.17v2.25c1.29-1.77 3.68-2.92 6.83-2.92 4.82 0 8.92 3.41 8.92 9.89zM244.89 34.15l-7.65-10.56v10.56h-7.16V.71h7.16v20l7.17-10.46h8.36l-8.69 12 8.92 11.9z"
              fill="#1e1e1e"></path>
        <path d="M255.16 30.28a4.54 4.54 0 114.54 4.54 4.58 4.58 0 01-4.54-4.54zm.24-20V.71h8.6v9.55l-1.43 12h-5.73z"
              fill="#fff"></path>
        <path d="M0 47.85a4.15 4.15 0 014.21-4.18 4.18 4.18 0 110 8.35A4.14 4.14 0 010 47.85zm7.59 0a3.36 3.36 0 00-3.38-3.41 3.41 3.41 0 000 6.82 3.36 3.36 0 003.38-3.41zM18.93 47.85A4.12 4.12 0 0114.79 52a3.8 3.8 0 01-3.45-2v5.06h-.8V43.84h.8v1.86a3.8 3.8 0 013.45-2 4.13 4.13 0 014.14 4.15zm-.8 0a3.4 3.4 0 10-3.39 3.41 3.37 3.37 0 003.39-3.41zM28.64 47.88v.38h-7.26a3.25 3.25 0 003.39 3 3.06 3.06 0 002.77-1.46l.7.42A3.94 3.94 0 0124.75 52a4.18 4.18 0 113.89-4.14zm-7.26-.4h6.43a3.11 3.11 0 00-3.12-3 3.22 3.22 0 00-3.31 3zM37.51 46.87v5h-.82v-5a2.21 2.21 0 00-2.35-2.43c-1.57 0-2.8 1-2.8 3.18v4.23h-.8v-8h.8v1.53a3 3 0 012.86-1.7 3 3 0 013.11 3.19zM49.89 49.75c0 1.31-1.15 2.25-2.89 2.25a3 3 0 01-3-1.77l.69-.4A2.29 2.29 0 0047 51.26c1.13 0 2.07-.5 2.07-1.51 0-2.18-4.85-.93-4.85-3.81A2.44 2.44 0 0147 43.67a2.81 2.81 0 012.72 1.6l-.67.38a2.09 2.09 0 00-2-1.21c-1 0-1.92.54-1.92 1.5-.13 2.15 4.76.88 4.76 3.81zM51.28 47.85A4.2 4.2 0 1155.49 52a4.15 4.15 0 01-4.21-4.15zm7.59 0a3.39 3.39 0 10-3.38 3.41 3.36 3.36 0 003.38-3.41zM68.39 43.84v8h-.8v-1.51A3 3 0 0164.72 52a3 3 0 01-3.1-3.2v-5h.81v5a2.21 2.21 0 002.35 2.44c1.57 0 2.81-1 2.81-3.19v-4.21zM74.54 43.73v.77a2.59 2.59 0 00-2.67 2.9v4.45h-.8v-8h.8v1.57a2.71 2.71 0 012.67-1.69zM75.38 47.85a4.1 4.1 0 014.2-4.18 3.74 3.74 0 013.49 2l-.65.38a3 3 0 00-2.84-1.66 3.41 3.41 0 000 6.82 3.22 3.22 0 002.89-1.67l.67.4a3.94 3.94 0 01-3.56 2 4.09 4.09 0 01-4.2-4.09zM92.67 47.88v.38h-7.26a3.26 3.26 0 003.39 3 3.06 3.06 0 002.77-1.46l.7.42A3.94 3.94 0 0188.78 52a4.18 4.18 0 113.89-4.14zm-7.26-.4h6.43a3.1 3.1 0 00-3.12-3 3.22 3.22 0 00-3.31 3zM99 41.27a.64.64 0 11.64.64.64.64 0 01-.64-.64zm.24 2.57h.8v8h-.8zM109.54 46.87v5h-.82v-5a2.21 2.21 0 00-2.35-2.43c-1.57 0-2.8 1-2.8 3.18v4.23h-.8v-8h.8v1.53a3 3 0 012.86-1.7 3 3 0 013.11 3.19zM113.73 44.63v5.2c0 1.41.75 1.44 2.38 1.3v.72c-2.09.32-3.2-.19-3.2-2v-5.2h-1.76v-.79h1.76v-2l.82-.24v2.24h2.38v.79zM125.36 47.88v.38h-7.26a3.27 3.27 0 003.4 3 3.06 3.06 0 002.77-1.46l.7.42a4 4 0 01-3.49 1.8 4.18 4.18 0 113.89-4.14zm-7.27-.4h6.44a3.11 3.11 0 00-3.12-3 3.23 3.23 0 00-3.32 3zM135.36 43.84v7.62a3.69 3.69 0 01-4 3.77 3.93 3.93 0 01-3.78-1.93l.7-.4a3.09 3.09 0 003.08 1.56 2.86 2.86 0 003.18-3V50a3.8 3.8 0 01-3.44 2 4.18 4.18 0 010-8.35 3.8 3.8 0 013.44 2v-1.81zm-.8 4a3.4 3.4 0 10-3.39 3.41 3.37 3.37 0 003.39-3.4zM141.52 43.73v.77a2.59 2.59 0 00-2.67 2.9v4.45h-.8v-8h.8v1.57a2.69 2.69 0 012.67-1.69zM150.77 43.84v8H150V50a3.84 3.84 0 01-3.44 2 4.18 4.18 0 010-8.35 3.84 3.84 0 013.44 2v-1.81zm-.82 4a3.39 3.39 0 10-3.37 3.41 3.35 3.35 0 003.42-3.4zM155.17 44.63v5.2c0 1.41.75 1.44 2.38 1.3v.72c-2.1.32-3.2-.19-3.2-2v-5.2h-1.76v-.79h1.76v-2l.82-.24v2.24h2.38v.79zM159.45 41.27a.64.64 0 01.64-.63.64.64 0 110 1.27.64.64 0 01-.64-.64zm.24 2.57h.8v8h-.8zM162.64 47.85a4.2 4.2 0 114.21 4.15 4.15 4.15 0 01-4.21-4.15zm7.58 0a3.39 3.39 0 10-3.37 3.41 3.35 3.35 0 003.37-3.41zM180 46.87v5h-.81v-5a2.21 2.21 0 00-2.36-2.43c-1.57 0-2.8 1-2.8 3.18v4.23h-.8v-8h.8v1.53a3 3 0 012.87-1.7 3 3 0 013.1 3.19zM192.34 49.75c0 1.31-1.16 2.27-2.87 2.27a3 3 0 01-3-1.77l.69-.4a2.29 2.29 0 002.35 1.41c1.12 0 2.07-.5 2.07-1.51 0-2.18-4.85-.93-4.85-3.81a2.44 2.44 0 012.72-2.27 2.82 2.82 0 012.72 1.6l-.67.38a2.09 2.09 0 00-2.05-1.21c-1 0-1.92.54-1.92 1.5-.04 2.15 4.81.88 4.81 3.81zM202.88 47.85a4.12 4.12 0 01-4.15 4.15 3.8 3.8 0 01-3.44-2v5.06h-.8V43.84h.8v1.86a3.8 3.8 0 013.44-2 4.13 4.13 0 014.15 4.15zm-.8 0a3.4 3.4 0 10-3.39 3.41 3.37 3.37 0 003.39-3.41zM212.59 47.88v.38h-7.25a3.25 3.25 0 003.39 3 3.06 3.06 0 002.77-1.46l.7.42a3.94 3.94 0 01-3.5 1.78 4.18 4.18 0 113.89-4.14zm-7.26-.4h6.43a3.11 3.11 0 00-3.12-3 3.22 3.22 0 00-3.31 3zM214.14 47.85a4.1 4.1 0 014.21-4.18 3.75 3.75 0 013.49 2l-.66.38a3 3 0 00-2.83-1.66 3.41 3.41 0 000 6.82 3.2 3.2 0 002.88-1.67l.67.4a3.93 3.93 0 01-3.55 2 4.09 4.09 0 01-4.21-4.09zM223.64 41.27a.65.65 0 11.65.64.64.64 0 01-.65-.64zm.24 2.57h.81v8h-.81zM235.23 43.84v8h-.81V50a3.86 3.86 0 01-3.42 2 4.18 4.18 0 010-8.35 3.86 3.86 0 013.45 2v-1.81zm-.81 4a3.39 3.39 0 10-3.42 3.42 3.36 3.36 0 003.42-3.41zM237.92 40.16h.8v11.69h-.8zM241.16 41.27a.64.64 0 01.64-.63.64.64 0 110 1.27.64.64 0 01-.64-.64zm.24 2.57h.8v8h-.8zM250.29 49.75c0 1.31-1.16 2.27-2.87 2.27a3 3 0 01-3-1.77l.69-.4a2.29 2.29 0 002.35 1.41c1.12 0 2.07-.5 2.07-1.51 0-2.18-4.85-.93-4.85-3.81a2.44 2.44 0 012.72-2.27 2.82 2.82 0 012.72 1.6l-.67.38a2.09 2.09 0 00-2-1.21c-1 0-1.92.54-1.92 1.5-.09 2.15 4.76.88 4.76 3.81zM253.85 44.63v5.2c0 1.41.75 1.44 2.39 1.3v.72c-2.1.32-3.2-.19-3.2-2v-5.2h-1.76v-.79H253v-2l.81-.24v2.24h2.39v.79zM263.33 49.75c0 1.31-1.16 2.27-2.87 2.27a3 3 0 01-3-1.77l.69-.4a2.29 2.29 0 002.35 1.41c1.12 0 2.07-.5 2.07-1.51 0-2.18-4.85-.93-4.85-3.81a2.44 2.44 0 012.72-2.27 2.82 2.82 0 012.72 1.6l-.67.38a2.09 2.09 0 00-2.05-1.21c-1 0-1.92.54-1.92 1.5-.04 2.15 4.81.88 4.81 3.81z"
              fill="#1e1e1e"></path>
    </svg>
</div>

<form method="post" action="xslt-debugger.jsp">
    <div class="form-container">
        <div class="xslt-input">
            <textarea placeholder="XML INPUT" autocomplete="off" spellcheck="false" id="xmlInput" name="xmlInput"
                      rows="5" cols="50"></textarea>

            <br>

            <textarea placeholder="XSL INPUT" autocomplete="off" spellcheck="false" id="xslInput" name="xslInput"
                      rows="5" cols="50"></textarea>
        </div>
        <span class="notice-ladybug">Leave text fields blank if you want to go to Ladybug immediately without doing a transformation</span>

        <div class="xslt-version">
            <label for="xsltVersion">XSLT Version: </label>
            <select id="xsltVersion" name="xsltVersion" rows="5" cols="50">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
            <br/>
        </div>
        <input class="a-button float-left" type="submit" value="To Ladybug!">
    </div>
</form>

<div class="footer">
    <h1 class="footer-title">Disclaimer</h1>
    <p class="footer-content">Please be advised that the data you provide while using this program may be shared with
        others due to the nature of our backend storage system.</p>
</div>
</body>
</html>

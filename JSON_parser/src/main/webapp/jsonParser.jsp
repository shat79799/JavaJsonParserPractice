<%@ page import="java.io.*, org.json.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>JSON Parser Example</title>
</head>
<body>
<h2>JSON Parsing Result:</h2>

<%
    // JSON 檔案名稱（與 JSP 同目錄）
    String fileName = application.getRealPath("products.json");

    try {
        // 讀取 JSON 檔案
        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
        reader.close();

     	// 將 JSON 字串轉為陣列
        JSONArray jsonArray = new JSONArray(jsonBuilder.toString());
		out.print("json array count: " + jsonArray.length() + "<br/>");
		
		// 表格開始
		out.print("<ol>");
     	
     	// 逐筆解析每個物件
        for (int i = 0; i < jsonArray.length(); i++) {
        	JSONObject obj = jsonArray.getJSONObject(i);
        	
    		String title = obj.getString("title");
    		out.print("<li>" + title + "</li>");
        }
     	
     	// 	表格結束
     	out.print("</ol>");
    } catch (FileNotFoundException e) {
        out.println("<p style='color:red;'>❌ JSON file not found: " + e.getMessage() + "</p>");
    } catch (IOException e) {
        out.println("<p style='color:red;'>❌ IO error: " + e.getMessage() + "</p>");
    } catch (JSONException e) {
        out.println("<p style='color:red;'>❌ JSON parse error: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>

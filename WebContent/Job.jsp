<%@ page import="java.sql.*, java.io.FileWriter, java.util.ArrayList, java.util.List"%>

<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Establish a connection to the MySQL database
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/job_ass";
        String username = "root";
        String password = "Ckk@8099";
        connection = DriverManager.getConnection(jdbcUrl, username, password);

        // Query to retrieve data from the table
        String query = "SELECT * FROM user";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

        // Convert resultSet to a list of JSON objects
        List<String> jsonList = new ArrayList<>();
        while (resultSet.next()) {
            // Create a JSON object for each row
            StringBuilder json = new StringBuilder("{");
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                String columnValue = resultSet.getString(i);
                json.append("\"").append(columnName).append("\":\"").append(columnValue).append("\"");
                if (i < columnCount) {
                    json.append(",");
                }
            }
            json.append("}");
            jsonList.add(json.toString());
        }

        // Write JSON data to a file
        try (FileWriter writer = new FileWriter("C:/Users/CHETAN/Desktop/JOB_Ass/Data.json")) {
            writer.write("[");
            for (int i = 0; i < jsonList.size(); i++) {
                writer.write(jsonList.get(i));
                if (i < jsonList.size() - 1) {
                    writer.write(",");
                }
            }
            writer.write("]");
        }

        out.println("Data successfully stored in data.json");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources
        try { resultSet.close(); } catch (Exception e) { /* ignored */ }
        try { statement.close(); } catch (Exception e) { /* ignored */ }
        try { connection.close(); } catch (Exception e) { /* ignored */ }
    }
%>

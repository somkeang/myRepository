<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function display()
            {
                var selected_isbn = document.getElementById("myisbn").value;
                var title = "";
                if (selected_isbn === "0001"){
                    title = "Book1";
                } else if (selected_isbn === "0002"){
                    title = "Book2";
                } else if (selected_isbn === "0003"){
                    title = "Book3";
                } else if (selected_isbn === "0004"){
                    title = "Book4";
                } 
                document.getElementById("title").value = title;
            }

        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% ArrayList<String> all_isbn = new ArrayList<>();%>
        <% all_isbn.add("0001"); %>
        <% all_isbn.add("0002"); %>
        <% all_isbn.add("0003"); %>
        <% all_isbn.add("0004");%>
        <% pageContext.setAttribute("all_isbn", all_isbn);%>

        <% String selected_isbn = (String) session.getAttribute("selected_isbn");
            if (selected_isbn == null) {
                selected_isbn = "0001";
            }
        %>
        <% session.setAttribute("selected_isbn", selected_isbn); %>
        <% if (pageContext.getAttribute("title") == null) {
            pageContext.setAttribute("title", "Book1");
        }%>
        <form>
            <select name="myisbn" id="myisbn" onChange="display()" >
                <c:forEach var="each_isbn" items="${all_isbn}">
                    <option value="${each_isbn}" ${each_isbn == sessionScope.selected_isbn ? 'selected="selected"' : ''}>${each_isbn}</option>
                </c:forEach>
            </select>
            <br>
            
            Title : <input type="text" id="title" name="title" value="${title}" size="20" />
        </form>
    </body>
</html>

<%
    String name=request.getParameter("name");
    String with=request.getParameter("with");
    session.setAttribute("name", name);
    session.setAttribute("with", with);
    response.sendRedirect("chat.jsp");
%>
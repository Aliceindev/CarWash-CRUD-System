<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluindo..</title>
        <script>
            function redirecionarParaPagina() {
                window.location.href = '../view/sucesso_exc.html';
            }
        </script>
    </head>
    <body>
        <%

            int id;
            id = Integer.parseInt(request.getParameter("id"));

            try {
                Connection conecta;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_carro", "root", "");

                PreparedStatement st;
                st = conecta.prepareStatement("DELETE FROM veiculo WHERE id=?");
                st.setInt(1, id);
                st.executeUpdate();
                out.print("<script>redirecionarParaPagina();</script>");

            } catch (Exception erro) {
                String erroMsg = erro.getMessage();
                out.print("<p style='color:red;font-size=15px'>Entre em contato com o grupo de suporte e informe o erro:</p>" + erroMsg);
            }
        %>
    </body>
</html>
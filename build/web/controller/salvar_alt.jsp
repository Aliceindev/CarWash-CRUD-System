<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Salvando Alterar</title>
        <script>
            function redirecionarParaPagina() {
                window.location.href = '../view/sucesso_alt.html';
            }
            function redirecionarParaPaginaERROalt() {
                window.location.href = '../view/erro_alt.html';
            }
        </script>
    </head>
    <body>
        <%
            int id;
            String modelo, marca, placa, cor, proprietario;

            id = Integer.parseInt(request.getParameter("id"));
            modelo = request.getParameter("modelo");
            marca = request.getParameter("marca");
            placa = request.getParameter("placa");
            cor = request.getParameter("cor");
            proprietario = request.getParameter("proprietario");

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_carro", "root", "5873");

                st = conecta.prepareStatement("UPDATE veiculo SET modelo = ?, marca= ?, placa = ?, cor = ?, proprietario = ? WHERE id = ?");
                st.setString(1, modelo);
                st.setString(2, marca);
                st.setString(3, placa);
                st.setString(4, cor);
                st.setString(5, proprietario);
                st.setInt(6, id);
                st.executeUpdate();
                out.println("<script>redirecionarParaPagina();</script>");

            } catch (Exception x) {
                String erro = x.getMessage();

                if (erro.contains("Duplicate entry")) {
                    out.print("<script>redirecionarParaPaginaERROalt();</script>");
                } else {
                    out.print("<p style='color:blue;font-size=15px'>Mensagem de erro:</p>" + erro);
                }
            }
        %>
    </body>
</html>
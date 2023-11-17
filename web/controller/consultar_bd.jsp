<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consultar Page</title>
        <link rel="stylesheet" href="../style/sucess.css">
    </head>
    <body>

        <div class="menu">
            <img src="../assets/img/logo.png" alt="">
            <div class="nav">
                <a class="nav-link"  href="../index.html">Home</a>
                <a class="nav-link" href="../view/cadastro.html">Cadastre-se</a>
                <a class="nav-link" href="listar.jsp">Listagem</a>
                <a class="nav-link">Consultar</a>
            </div>
        </div>
        <div class="main-table">
            <div class="content-table">
                <%
                    String proprietario;
                    proprietario = request.getParameter("proprietario");
            
                    try {
                        Connection conecta;
                        PreparedStatement st;
                        Class.forName("com.mysql.cj.jdbc.Driver"); //Faz a conexao entre o driver e o java
                        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_carro", "root", "");

                        st = conecta.prepareStatement("SELECT * FROM veiculo WHERE proprietario LIKE ?");
                        st.setString(1, "%" + proprietario + "%");
                        ResultSet rs = st.executeQuery();
                %>
                <table>
                    <tr class="table-tittle">
                        <th>Id</th>
                        <th>Modelo</th>
                        <th>Marca</th>
                        <th>Placa</th>
                        <th>Cor</th>
                        <th style="background-color: black;">Proprietário</th>
                    </tr>
                    <%
                        while (rs.next()) {
                    %>  
                    <tr>
                        <td class="table-td"><%= rs.getString("id")%></td>
                        <td class="table-td"><%= rs.getString("modelo")%></td>
                        <td class="table-td"><%= rs.getString("marca")%></td>
                        <td class="table-td"><%= rs.getString("placa")%></td>
                        <td class="table-td"><%= rs.getString("cor")%></td>
                        <td class="table-td"><%= rs.getString("proprietario")%></td>
                        <td class="table-a1"><a class="letter-a" href="excluir.jsp?id=<%= rs.getString("id")%>">excluir</a></td>
                        <td class="table-a2"><a class="letter-a" href="alterar.jsp?id=<%= rs.getString("id")%>">editar</a></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%
                    } catch (Exception x) {
                        out.print("Mensagem de erro:" + x.getMessage());
                    }
                %>
            </div>
        </div>
    </body>
</html>

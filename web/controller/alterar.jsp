<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alterar Page</title>

        <link rel="stylesheet" href="../style/style.css">
    </head>
    <body>
        <div class="menu">
            <img src="../assets/img/logo.png" alt="" class="logo-img">
            <div class="nav">
                <a class="nav-link" href="../index.html">Home</a>
                <a class="nav-link" href="../view/cadastro.html">Cadastre-se</a>
                <a class="nav-link" href="listar.jsp">Listagem</a>
            </div>
        </div>
        <div class="main">
            <div class="submain">
                <div class="form-fundo-alt">
                    <img src="../assets/img/logo-alt.png" alt="" class="cad-img">
                    <%
                        int id;
                        id = Integer.parseInt(request.getParameter("id"));

                        Connection conecta;
                        PreparedStatement st;
                        Class.forName("com.mysql.cj.jdbc.Driver"); //Faz a conexao entre o driver e o java
                        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_carro", "root", "5873");

                        st = conecta.prepareStatement("SELECT * FROM veiculo WHERE id = ?");
                        st.setInt(1, id);
                        ResultSet resultado = st.executeQuery();

                        //Verificar se dentro de "resultado" não tem outra linha 
                        if (!resultado.next()) {
                            out.print("Este produto não foi encontrado");
                        } else {
                    %>
                    <form method="post" action="salvar_alt.jsp">
                        <div class="form-control-only">
                            <input type="number" name="id" id="id" class="form-input-only" readonly value="<%=resultado.getString("id")%>">
                            <label for="id">Código</label>
                        </div>
                        <div class="form-control">
                            <input type="text" name="modelo" id="modelo" class="form-input" maxlength="50" value="<%=resultado.getString("modelo")%>">
                            <label for="modelo">Modelo</label>
                        </div>
                        <div class="form-control">
                            <input type="text" name="marca" id="marca" class="form-input" size="50" maxlength="50" value="<%=resultado.getString("marca")%>">
                            <label for="marca">Marca</label>
                        </div>
                        <div class="form-control">
                            <input type="text" name="placa" id="placa" class="form-input" maxlength="7" value="<%=resultado.getString("placa")%>">
                            <label for="placa">Placa</label>
                        </div>
                        <div class="form-control">
                            <input type="text" name="cor" id="cor" class="form-input"  maxlength="50" value="<%=resultado.getString("cor")%>">
                            <label for="cor">Cor</label>
                        </div>
                        <div class="form-control">
                            <input type="text" name="proprietario" id="proprietario" class="form-input" maxlength="50" value="<%=resultado.getString("proprietario")%>">
                            <label for="proprietario">Proprietario</label>
                        </div>
                        <div class="form-control">
                            <input type="submit" class="button-conf" value="Confirmar">
                        </div>

                    </form>
                    <%
                        }
                    %>

                </div>
            </div>
            <div class="sub2main">
                <img src="../assets/img/carro.png" alt="" class="carro-img">
            </div>
        </div>
    </body>
</html>

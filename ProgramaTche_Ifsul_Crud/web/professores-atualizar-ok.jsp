<%@page import="modelo.Professor"%>
<%@page import="dao.ProfessorDAO"%>
<%@include file="cabecalho.jsp"%>
<%
if(request.getParameter("txtNome") == null || request.getParameter("txtSiape")==null)
{
    response.sendRedirect("professores.jsp");
    return;
}

String txtSiape = request.getParameter("txtSiape");
String txtNome = request.getParameter("txtNome");
//Buscar o registro pela chave prim�ria
//Alterar os demais valores (nesse caso apenas Nome)
//mandar alterar
ProfessorDAO dao = new ProfessorDAO();
//busquei o professor pelo siape (registro pela C.Prim�ria)
Professor obj = dao.buscarPorChavePrimaria(txtSiape);
//Se n�o encontrou o registro volta pra lista
if(obj == null)
{
    response.sendRedirect("professores.jsp");
    return;
}
//Atualizar as demais informa��es enviadas
obj.setNome(txtNome);

dao.alterar(obj);



%>

         <h1 class="centro">Atualiza��o de Professores</h1>
            
         <div>
             Registro alterado com sucesso.<br />
             <a href="professores.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>

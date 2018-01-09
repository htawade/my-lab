<%@page import="java.util.Date"%>
<%@page import="java.lang.String"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%!
	Connection conn = null;
   	String driver = "org.postgresql.Driver";
   	static String a []  = new String  [100] ;
   	static int i = 0 ;
	static int p = 0 ;
	static int marks = 0;
	static String b []  = new String [100] ;
   	Statement st = null;
    ResultSet rs = null;
   	
   		
   	public void jspInit(){
    	try {
			Class.forName(driver);
			conn = DriverManager.getConnection( "jdbc:postgresql://localhost:5432/postgres","postgres", "hitesh123");
            st = conn.createStatement();
            if( conn == null ){
           		System.out.println("not connect");
            }
            else{
            	System.out.println("connect");
            }                       	
     	}
    	catch(Exception ex){
        	System.out.println(ex);
        }
	}	
   	
%>
<%
		i++;
		if(request.getParameter("ans")!=null){
			if(request.getParameter("ans").toString().equals(b[p-1])){
				marks++;
			}
		}
%>

<html>
	<head>
		<script>
			function myFunction() {
    			document.getElementById("demo").innerHTML = "Marks of Test : <%=marks%>";
			}
		</script>
	</head>
	<body>
			<div id=demo>
				<form action=first.jsp>
				<%
				String query1 = "select * from mcq ORDER BY RANDOM() LIMIT 1";
				rs=st.executeQuery(query1);
				while(rs.next()){	
					b[p]=rs.getString("ans");
					p++;
				%>
					
					 <b><%=rs.getString("que")%></b><br>
					<input type="radio" name="ans" id="radio4" value='1' />
					
						<label for="radio4"><%=rs.getString("a")%></label><br>
					
					<input type="radio" name="ans" id="radio4" value='2' />
					
						<label for="radio4"><%=rs.getString("b")%></label><br>
				
					<input type="radio" name="ans" id="radio4" value='3' />
				
						<label for="radio4"><%=rs.getString("c")%></label><br>
				
					<input type="radio" name="ans" id="radio4" value='4' />
				
						<label for="radio4"><%=rs.getString("d")%></label>	<br>
				<%} %>
					<input type=submit value=next>
				
					<button onclick="myFunction()">Submit test</button>
			
				
				</form>
			</div>
	</body>
</html>

                               







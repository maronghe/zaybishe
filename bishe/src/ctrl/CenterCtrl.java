package ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.Turang;

/**
 * Servlet implementation class CenterCtrl
 */
@WebServlet("*.action")
@MultipartConfig
public class CenterCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CenterCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=GBK");

		request.setCharacterEncoding("GBK");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String path = request.getServletPath();
		System.out.println("path=" + path);
		if (path.equals("/zhuce.action")) {
			String name = request.getParameter("user");
			String pass = request.getParameter("pass");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			int i = new User().addUser(name, pass, tel, addr);
			if (i == 1) {

				request.setAttribute("msg", "注册成功");
				request.setAttribute("url", "login.html");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "注册失败");
				request.setAttribute("url", "zhuce.jsp");
				request.getRequestDispatcher("result.jsp").forward(request, response);

			}

		}

		else if (path.equals("/Login.action")) {
			String name = request.getParameter("username");
			String pass = request.getParameter("password");
			// 调用model的相关方案来判断是否是合法用户
			System.out.println("name:" + name);
			System.out.println("password:" + pass);
			Map<String, String> user = new User().checkUser(name, pass);
			// 根据model执行的结果。调用view层的相关页面
			if (user != null) {
				session.setAttribute("user", name);
				if (user.get("ident").equals("1")) {
					request.setAttribute("msg", "管理员登录成功");
					request.setAttribute("url", "guan.action");
					request.getRequestDispatcher("result.jsp").forward(request, response);
				}
				// 用户就进入
				else {
					request.setAttribute("msg", "普通用户登录成功");
					request.setAttribute("url", "turang.action");
					request.getRequestDispatcher("result.jsp").forward(request, response);
				}

			} else {
				out.println("登录失败");
				response.setHeader("Refresh", "5;URL=Login.jsp");
			}
		}

		else if (path.equals("/guan.action")) {

			List<Map<String, String>> users = new User().getUsers();
			// diao yong
			request.setAttribute("user", users);

			request.getRequestDispatcher("guan.jsp").forward(request, response);
		}

		else if (path.equals("/zeng.action")) {
			String name = request.getParameter("user");
			String pass = request.getParameter("pass");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			int i = new User().addUser1(name, pass, tel, addr);
			if (i == 1) {

				request.setAttribute("msg", "添加成功");
				request.setAttribute("url", "guan.action");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "添加失败");
				request.setAttribute("url", "zeng.jsp");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}

		}

		else if (path.equals("/edituser.action")) {
			// 获取view层的id
			String id = request.getParameter("id");
			// 调用model层的相关方法去执行编辑操作
			Map<String, String> user = new User().getUser(id);
			// 根据执行结果，调用View层不同的相应页面
			request.setAttribute("user", user);
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		} else if (path.equals("/editDo.action")) {
			String id = request.getParameter("id");
			String name = request.getParameter("user");
			String pass = request.getParameter("pass");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			int i = new User().editUser(id, name, pass, tel, addr);
			request.setAttribute("msg", i == 1 ? "修改成功!" : "修改失败!");
			request.setAttribute("url", "guan.action");
			request.getRequestDispatcher("result.jsp").forward(request, response);
		}

		else if (path.equals("/deluser.action")) {
			// 获取view层的Id
			String id = request.getParameter("id");

			// 调用Model层的相关方法去执行删除操作
			int i = new User().delUser(id);
			// 根据执行结果，调用view层不同的相应界面

			request.setAttribute("msg", i == 1 ? "删除成功" : "删除失败");
			request.setAttribute("url", "guan.action");
			request.getRequestDispatcher("result.jsp").forward(request, response);

		}

		else if (path.equals("/turang.action")) {

			// chaxun
			List<Map<String, String>> turangs = new Turang().getTurang();
			// diao yong
			request.setAttribute("turang", turangs);

			request.getRequestDispatcher("turang.jsp").forward(request, response);

		}

	}
}

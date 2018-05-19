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

				request.setAttribute("msg", "ע��ɹ�");
				request.setAttribute("url", "login.html");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "ע��ʧ��");
				request.setAttribute("url", "zhuce.jsp");
				request.getRequestDispatcher("result.jsp").forward(request, response);

			}

		}

		else if (path.equals("/Login.action")) {
			String name = request.getParameter("username");
			String pass = request.getParameter("password");
			// ����model����ط������ж��Ƿ��ǺϷ��û�
			System.out.println("name:" + name);
			System.out.println("password:" + pass);
			Map<String, String> user = new User().checkUser(name, pass);
			// ����modelִ�еĽ��������view������ҳ��
			if (user != null) {
				session.setAttribute("user", name);
				if (user.get("ident").equals("1")) {
					request.setAttribute("msg", "����Ա��¼�ɹ�");
					request.setAttribute("url", "guan.action");
					request.getRequestDispatcher("result.jsp").forward(request, response);
				}
				// �û��ͽ���
				else {
					request.setAttribute("msg", "��ͨ�û���¼�ɹ�");
					request.setAttribute("url", "turang.action");
					request.getRequestDispatcher("result.jsp").forward(request, response);
				}

			} else {
				out.println("��¼ʧ��");
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

				request.setAttribute("msg", "��ӳɹ�");
				request.setAttribute("url", "guan.action");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "���ʧ��");
				request.setAttribute("url", "zeng.jsp");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}

		}

		else if (path.equals("/edituser.action")) {
			// ��ȡview���id
			String id = request.getParameter("id");
			// ����model�����ط���ȥִ�б༭����
			Map<String, String> user = new User().getUser(id);
			// ����ִ�н��������View�㲻ͬ����Ӧҳ��
			request.setAttribute("user", user);
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		} else if (path.equals("/editDo.action")) {
			String id = request.getParameter("id");
			String name = request.getParameter("user");
			String pass = request.getParameter("pass");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			int i = new User().editUser(id, name, pass, tel, addr);
			request.setAttribute("msg", i == 1 ? "�޸ĳɹ�!" : "�޸�ʧ��!");
			request.setAttribute("url", "guan.action");
			request.getRequestDispatcher("result.jsp").forward(request, response);
		}

		else if (path.equals("/deluser.action")) {
			// ��ȡview���Id
			String id = request.getParameter("id");

			// ����Model�����ط���ȥִ��ɾ������
			int i = new User().delUser(id);
			// ����ִ�н��������view�㲻ͬ����Ӧ����

			request.setAttribute("msg", i == 1 ? "ɾ���ɹ�" : "ɾ��ʧ��");
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

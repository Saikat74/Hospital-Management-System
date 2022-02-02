import java.awt.Frame;
import java.awt.TextField;
import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Label;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.WindowListener;
import java.awt.event.WindowEvent;

class SmsPage1 extends Frame implements ActionListener, WindowListener{
	public StudentLog logS;
	public TeacherLog logT;
	public AdminLog logA;
	public SmsPage1(){
		super("Student Management System");
		Button b1=new Button("Student");
		Button b2=new Button("Teacher");
		Button b3=new Button("Admin");
		add(b1); add(b2); add(b3);
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		addWindowListener(this);
		setBounds(400,150,550,450);
		setLayout(new FlowLayout());
		setVisible(true);
	}
	public void actionPerformed(ActionEvent e){
		String s=e.getActionCommand();
		if(s.equals("Student"))
		{
			logS=new StudentLog(this);
			this.setVisible(false);
			logS.setVisible(true);
		}
		else if(s.equals("Teacher"))
		{
			logT=new  TeacherLog(this);
			this.setVisible(false);
			logT.setVisible(true);

		}
		else if(s.equals("Admin"))
		{
			logA=new AdminLog(this);
			this.setVisible(false);
			logA.setVisible(true);
		}
	}
	public void windowActivated(WindowEvent e){}
	public void windowClosed(WindowEvent e){}
	public void windowClosing(WindowEvent e){
		System.exit(0);
	}
	public void windowDeactivated(WindowEvent e){}
	public void windowDeiconified(WindowEvent e){}
	public void windowIconified(WindowEvent e){}
	public void windowOpened(WindowEvent e){}
}
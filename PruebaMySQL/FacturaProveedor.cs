//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class FacturaProveedor : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public FacturaProveedor()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM FacturaProveedor";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "FacturaProveedor");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["FacturaProveedor"];
        }
        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            FacturaCliente fac = new FacturaCliente();
            fac.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            HorarioTrabajo hor = new HorarioTrabajo();
            hor.Show();
        }

        private void FacturaProveedor_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string fecha = textBox1.Text;
            string remitente = textBox2.Text;
            string cantidad = textBox3.Text;
            string idContador = textBox4.Text;
            string estatus = textBox6.Text;
            consulta = "INSERT INTO FacturaProveedor (fecha, remitente, cantidad, idContador, estatus) values('" + fecha + "', '" + remitente + "', '" + cantidad + "', '" + idContador + "' ,  '" + estatus + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
 
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string fecha = textBox1.Text;
            string remitente = textBox2.Text;
            string cantidad = textBox3.Text;
            string idContador = textBox4.Text;
            string estatus = textBox6.Text;
            int idFacturaProveedor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE FacturaProveedor SET fecha = '" + fecha + "',remitente = '" + remitente + "',cantidad = '" + cantidad + "',idContador = '" + idContador + "', estatus = '" + estatus + "' WHERE idFacturaProveedor = " + idFacturaProveedor.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox6.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idFacturaProveedor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE FacturaProveedor SET Estatus = 0 WHERE idFacturaProveedor = " + idFacturaProveedor.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Contrato : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Contrato()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Contrato";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Contrato");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Contrato"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Contador cont = new Contador();
            cont.Show();

        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Convenio conv = new Convenio();
            conv.Show();
        }

        private void Contrato_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string numero = textBox1.Text;
            string fecha = textBox2.Text;
            string nombre = textBox3.Text;
            string servicio = textBox4.Text;
            consulta = "INSERT INTO Contrato (numero, fecha, nombre, servicio) values('" + numero + "', '" + fecha + "', '" + nombre + "', '" + servicio+"')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string numero = textBox1.Text;
            string fecha = textBox2.Text;
            string nombre = textBox3.Text;
            string servicio = textBox4.Text;
            int idContrato = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Contrato SET numero = '" + numero + "',fecha = '" + fecha + "',nombre = '" + nombre + "',servicio = '" + servicio + "' WHERE idContrato = " + idContrato.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idContrato = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Contrato SET Estatus = 0 WHERE idContrato = " + idContrato.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

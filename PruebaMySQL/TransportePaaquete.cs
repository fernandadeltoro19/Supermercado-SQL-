using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class TransportePaaquete : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public TransportePaaquete()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM TransportePaquete";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "TransportePaquete");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["TransportePaquete"];
        }

        private void TransportePaaquete_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idTransporte = textBox1.Text;
            string idPaquete = textBox2.Text;
            string estatus = textBox3.Text;
            consulta = "INSERT INTO TransportePaquete (idTransporte, idPaquete, estatus) values('" + idTransporte + "', '" + idPaquete + "', '" + estatus + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idTransportePaquete = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE TransportePaquete SET Estatus = 0 WHERE idTransportePaquete = " + idTransportePaquete.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            string idTransporte = textBox1.Text;
            string idPaquete = textBox2.Text;
            string estatus = textBox3.Text;
            int idTransportePaquete = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE TransportePaquete SET idTransporte = '" + idTransporte + "',idPaquete = '" + idPaquete + "', estatus = '" + estatus + "' WHERE idTransportePaquete = " + idTransportePaquete.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            SucursalEmpleadoo bode = new SucursalEmpleadoo();
            bode.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {

        }
    }
}

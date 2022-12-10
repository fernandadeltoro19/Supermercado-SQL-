using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class ClienteCotizacion : Form

    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public ClienteCotizacion()
        {
            InitializeComponent();
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM ClienteCotizacion";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "ClienteCotizacion");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["ClienteCotizacion"];
        }
        private void ClienteCotizacion_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idCliente = textBox1.Text;
            string idCotizacion = textBox2.Text;
            string estatus = textBox3.Text;
            consulta = "INSERT INTO ClienteCotizacion (idCliente, idCotizacion, estatus) values('" + idCliente + "', '" + idCotizacion + "', '"  + "', '" + estatus + "')";
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
            int idClienteCotizacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE ClienteCotizacion SET Estatus = 0 WHERE idClienteCotizacion = " + idClienteCotizacion.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            string idCliente = textBox1.Text;
            string idCotizacion = textBox2.Text;
            string estatus = textBox3.Text;
            int idClienteCotizacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE ClienteCotizacion SET idCliente = '" + idCliente + "',idCotizacion = '" + idCotizacion + "',, estatus ='" + estatus + "' WHERE idClienteCotizacion = " + idClienteCotizacion.ToString();
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
            ClienteCompra bode = new ClienteCompra();
            bode.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            ClienteCredito bode = new ClienteCredito ();
            bode.Show();
        }
    }
}

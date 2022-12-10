//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace PruebaMySQL
{
    public partial class Prestacion : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Prestacion()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Prestacion";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Prestacion");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Prestacion"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            PedidoLinea pedi = new PedidoLinea();
            pedi.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Produccion produ = new Produccion();
            produ.Show();
        }

        private void Prestacion_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string tipo = textBox1.Text;
            consulta = "INSERT INTO Prestacion (tipo) values('" + tipo + "', '"  + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string tipo = textBox1.Text;
            int idPrestacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Prestacion SET tipo = '" + tipo +"' WHERE idPrestacion = " + idPrestacion.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idPrestacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Prestacion SET Estatus = 0 WHERE idPrestacion = " + idPrestacion.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}

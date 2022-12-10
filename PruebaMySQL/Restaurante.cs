//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace PruebaMySQL
{
    public partial class Restaurante : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Restaurante()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Restaurante";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Restaurante");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Restaurante"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Representante puesto = new Representante();
            puesto.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Sucursal repre = new Sucursal();
            repre.Show();
        }

        private void Receta_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string mesas = textBox1.Text;
            string sillas = textBox2.Text;
            string comida = textBox3.Text;
            consulta = "INSERT INTO Restaurante (mesas, sillas, comida) values('" + mesas + "', '" + sillas + "', '" + comida + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
         
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string mesas = textBox1.Text;
            string sillas = textBox2.Text;
            string comida = textBox3.Text;
            int idRestaurante = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Restaurante SET mesas = '" + mesas + "',sillas = '" + sillas + "',comida = '" + comida +  "' WHERE idReceta = " + idRestaurante.ToString();
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
            int idRestaurante = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Restaurante SET Estatus = 0 WHERE idRestaurante = " + idRestaurante.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

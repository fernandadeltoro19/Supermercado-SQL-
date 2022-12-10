//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Inventario : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Inventario()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Inventario";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Inventario");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Inventario"];
        }


        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            HorarioTrabajo hor = new HorarioTrabajo();
            hor.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Mantenimiento man = new Mantenimiento();
            man.Show();
        }

        private void Instrumento_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string nombre = textBox1.Text;
            string tipo = textBox2.Text;
            string fecha = textBox3.Text;
            consulta = "INSERT INTO Inventario (nombre, tipo, fecha) values('" + nombre + "', '" + tipo + "' , '" + fecha + "')";
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
            string nombre = textBox1.Text;
            string tipo = textBox2.Text;
            string fecha = textBox3.Text;
            int idInventario = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Inventario SET nombre = '" + nombre + "',tipo = '" + tipo + "',fecha = '" + fecha +"' WHERE idInvetario = " + idInventario.ToString();
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
            int idInstrumento = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Inventario SET Estatus = 0 WHERE idInstrumento = " + idInstrumento.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

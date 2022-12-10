//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Nomina : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Nomina()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Nomina";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Nomina");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Nomina"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Mobiliario mob = new Mobiliario();
            mob.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Oferta oferta = new Oferta();
            oferta.Show();
        }

        private void Nomina_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string fecha = textBox1.Text;
            string persona = textBox2.Text;
            string cantidad = textBox3.Text;
            string idContador = textBox4.Text;
            string estatus = textBox5.Text;
            consulta = "INSERT INTO Nomina (fecha, persona, cantidad, idContador, estatus) values('" + fecha + "', '" + persona
                + "', '" + cantidad + "' , '" + idContador + "' , '" + estatus + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
               
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string fecha = textBox1.Text;
            string persona = textBox2.Text;
            string cantidad = textBox3.Text;
            string idContador = textBox4.Text;
            string estatus = textBox5.Text;
            int idNomina = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Nomina SET fecha = '" + fecha + "',persona = '" + persona + "',cantidad = '" + cantidad + "' ,idContador = '" + idContador + "' ,estatus = '" + estatus + "'WHERE idNomina = " + idNomina.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idNomina = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Nomina SET Estatus = 0 WHERE idNomina = " + idNomina.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}

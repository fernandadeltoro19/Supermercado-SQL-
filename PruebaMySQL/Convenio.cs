﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Convenio : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Convenio()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Convenio";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Convenio");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Convenio"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Contrato cont = new Contrato();
            cont.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Cotizacion coti = new Cotizacion();
            coti.Show();
        }

        private void Convenio_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string fecha = textBox1.Text;
            string cantidad = textBox2.Text;
            consulta = "INSERT INTO Convenio (fecha, cantidad) values('" + fecha + "', '" + cantidad + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string fecha = textBox1.Text;
            string cantidad = textBox2.Text;

            int idConvenio = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Convenio SET fecha = '" + fecha + "',cantidad = '" + cantidad  + "' WHERE idConvenio = " + idConvenio.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idConvenio = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Convenio SET Estatus = 0 WHERE idConvenio = " + idConvenio.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


        }
    }
}

﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class MateriaPrima : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public MateriaPrima()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM MateriaPrima";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "MateriaPrima");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["MateriaPrima"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Marketing mar = new Marketing();
            mar.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Membresia medi = new Membresia();
            medi.Show();
        }

        private void MateriaPrima_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string material = textBox1.Text;
            string nombre = textBox2.Text;
            string cantidad = textBox3.Text;
            consulta = "INSERT INTO MateriaPrima (material, nombre, cantidad) values('" + material + "', '" + nombre + "', '" + cantidad + "')";
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
            string material = textBox1.Text;
            string nombre = textBox2.Text;
            string cantidad = textBox3.Text;
            int idMateriaPrima = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE MateriaPrima SET material = '" + material + "',nombre = '" + nombre + "',cantidad = '" + cantidad + "' WHERE idMateriaPrima = " + idMateriaPrima.ToString();
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
            int idMateriaPrima = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE MateriaPrima SET Estatus = 0 WHERE idMateriaPrima = " + idMateriaPrima.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

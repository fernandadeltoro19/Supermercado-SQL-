﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    
    public partial class ProductoEnvio : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public ProductoEnvio()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM ProductoEnvio";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "ProductoEnvio");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["ProductoEnvio"];
        }

        private void ProductoEnvio_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idProducto = textBox1.Text;
            string idEnvio = textBox2.Text;
            string fechaEnvio = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO ProductoEnvio (idProducto, idEnvio, fechaEnvio, estatus) values('" + idProducto + "', '" + idEnvio + "', '" + fechaEnvio + "', '" + estatus + "')";
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
            string idProducto = textBox1.Text;
            string idEnvio = textBox2.Text;
            string fechaEnvio = textBox3.Text;
            string estatus = textBox4.Text;
            int idProductoEnvio = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE ProductoEnvio SET idProducto = '" + idProducto + "',idEnvio = '" + idEnvio + "', fechaEnvio = '" + fechaEnvio + "', estatus ='" + estatus + "' WHERE idProductoEnvio = " + idProductoEnvio.ToString();
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
            int idProductoEnvio = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE ProductoEnvio SET Estatus = 0 WHERE idProductoEnvio = " + idProductoEnvio.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            EmpleadoPrestacion bode = new EmpleadoPrestacion();
            bode.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            ProductoOferta bode = new ProductoOferta();
            bode.Show();
        }
    }
}

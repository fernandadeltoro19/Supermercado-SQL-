﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class ProductoOferta : Form
    {

        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public ProductoOferta()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Bodega";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Bodega");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Bodega"];
        }
        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void ProductoOferta_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idProducto = textBox1.Text;
            string idOferta = textBox2.Text;
            string fechaOferta = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO ProductoOferta (idProducto, idOferta, fechaOferta, estatus) values('" + idProducto + "', '" + idOferta + "', '" + fechaOferta + "', '" + estatus + "')";
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
            string idOferta = textBox2.Text;
            string fechaOferta = textBox3.Text;
            string estatus = textBox4.Text;
            int idProductoOferta = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE ProductoOferta SET idProducto = '" + idProducto + "',idOferta = '" + idOferta + "', fechaOferta = '" + fechaOferta + "', estatus ='" + estatus + "' WHERE idProductoOferta = " + idProductoOferta.ToString();
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
            int idProductoOferta = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE ProductoOferta SET Estatus = 0 WHERE idProductoOferta = " + idProductoOferta.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            ProductoPedidoLinea bode = new ProductoPedidoLinea();
            bode.Show();
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            ProductoEnvio bode = new ProductoEnvio();
            bode.Show();
        }
    }
}

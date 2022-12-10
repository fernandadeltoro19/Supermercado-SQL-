﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class ProductoVenta : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public ProductoVenta()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM ProductoVenta";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "ProductoVenta");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["ProductoVenta"];
        }

        private void ProductoVenta_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idProducto = textBox1.Text;
            string idVenta = textBox2.Text;
            string fechaventa = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO ProductoVenta (idProducto, idVenta, fechaventa, estatus) values('" + idProducto + "', '" + idVenta + "', '" + fechaventa + "', '" + estatus + "')";
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
            int idProductoVenta = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE ProductoVenta SET Estatus = 0 WHERE idProductoVenta = " + idProductoVenta.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            string idProducto = textBox1.Text;
            string idVenta = textBox2.Text;
            string fechaventa = textBox3.Text;
            string estatus = textBox4.Text;
            int idProductoVenta = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE ProductoVenta SET idProducto = '" + idProducto + "',idVenta = '" + idVenta + "', fechaventa = '" + fechaventa + "', estatus ='" + estatus + "' WHERE idProductoVenta = " + idProductoVenta.ToString();
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

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            ProductoPedidoLinea bode = new ProductoPedidoLinea();
            bode.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            SucursalEmpleadoo bode = new SucursalEmpleadoo();
            bode.Show();
        }
    }
}

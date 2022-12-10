﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class PedidoLinea : Form
    {

        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public PedidoLinea()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM PedidoLinea";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "PedidoLinea");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["PedidoLinea"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Pasillo paque = new Pasillo();
            paque.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Prestacion pre = new Prestacion();
            pre.Show();
        }

        private void Pedido_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string fecha = textBox1.Text;
            string cantidad = textBox2.Text;
            string producto = textBox3.Text;
            consulta = "INSERT INTO PedidoLinea (fecha, cantidad, producto) values('" + fecha + "', '" + cantidad + "', '" + producto +"')";
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
            string fecha = textBox1.Text;
            string cantidad = textBox2.Text;
            string producto = textBox3.Text;
            int PedidoLinea = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE PedidoLinea SET fecha = '" + fecha + "',cantidad = '" + cantidad + "',producto = '" + producto + "' WHERE idPedido = " + PedidoLinea.ToString();
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
            int PedidoLinea = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE PedidoLinea SET Estatus = 0 WHERE idPedidPedidoLinea = " + PedidoLinea.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

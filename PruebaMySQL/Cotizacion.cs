﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Cotizacion : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Cotizacion()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Cotizacion";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Cotizacion");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Cotizacion"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Convenio conv = new Convenio();
            conv.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Credito credi = new Credito();
            credi.Show();
        }

        private void Cotizacion_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string cantidad = textBox1.Text;
            string producto = textBox2.Text;
            consulta = "INSERT INTO Cotizacion (cantidad, producto) values('" + cantidad + "', '" + producto + "')";
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
            string cantidad = textBox1.Text;
            string producto = textBox2.Text;
            int idCotizacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Cotizacion SET cantidad = '" + cantidad + "',producto = '" + producto + "' WHERE idCotizacion = " + idCotizacion.ToString();
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
            int idCotizacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Cotizacion SET Estatus = 0 WHERE idCotizacion = " + idCotizacion.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}

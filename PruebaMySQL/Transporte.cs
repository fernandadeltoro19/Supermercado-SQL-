﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Transporte : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Transporte()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Transporte";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Transporte");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Transporte"];
        }
        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            TarjetaPunto repre = new TarjetaPunto();
            repre.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Venta sucu = new Venta();
            sucu.Show();
        }

        private void Transporte_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string marca = textBox1.Text;
            string tipo = textBox2.Text;
            consulta = "INSERT INTO Transporte (marca, tipo) values('" + marca + "', '" + tipo + "')";
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
            string marca = textBox1.Text;
            string tipo = textBox2.Text;
            int idTransporte = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Transporte SET marca = '" + marca + "',tipo = '"  + "' WHERE idTransporte = " + idTransporte.ToString();
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
            int idTransporte = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Transporte SET Estatus = 0 WHERE idAgenda = " + idTransporte.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

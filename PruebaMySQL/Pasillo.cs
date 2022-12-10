﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Pasillo : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Pasillo()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Pasillo";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Pasillo");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Pasillo"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Paquete mat = new Paquete();
            mat.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            PedidoLinea met = new PedidoLinea();
            met.Show();
        }

        private void Medicamento_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string cantidad = textBox1.Text;
            string numero = textBox2.Text;
            string tipo = textBox3.Text;
            string idSucursal = textBox4.Text;
            string estatus = textBox5.Text;
            consulta = "INSERT INTO Pasillo (cantidad, numero, tipo, idSucursal, estatus) values('" + cantidad + "', '" + numero + "', '" + tipo + "', '" + idSucursal + "', '"+estatus +"')";
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
            string cantidad = textBox1.Text;
            string numero = textBox2.Text;
            string tipo = textBox3.Text;
            string idSucursal = textBox4.Text;
            string estatus = textBox5.Text;
            int idPasillo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Pasillo SET cantidad = '" + cantidad + "',numero = '" + numero + "',tipo = '" + tipo + "',idSucursal = '" + idSucursal + "' , estatus = '" +estatus+ "' WHERE idPasillo = " + idPasillo.ToString();
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
            int Pasillo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Medicamento SET Estatus = 0 WHERE idPasillo = " + Pasillo.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

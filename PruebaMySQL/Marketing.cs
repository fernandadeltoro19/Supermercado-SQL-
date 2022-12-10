﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Marketing : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Marketing()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Marketing";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Marketing");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Marketing"];
        }
        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Marca mar = new Marca();
            mar.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            MateriaPrima mat = new MateriaPrima();
            mat.Show();
        }

        private void Marketing_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string tipo = textBox1.Text;
            string lugar = textBox2.Text;
            string idSucursal = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Marketing (tipo, lugar, idSucursal, estatus) values('" + tipo + "', '" + lugar + "', '" + idSucursal + "', '" + estatus + "')";
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
            //Modificar
            string tipo = textBox1.Text;
            string lugar = textBox2.Text;
            string idSucursal = textBox3.Text;
            string estatus = textBox4.Text;
            int idMarketing = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Marketing SET tipo = '" + tipo + "',lugar = '" + lugar + "',idSucursal = '" + idSucursal + "',estatus = '" + estatus + "' WHERE idMarketing = " + idMarketing.ToString();
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
            int idMarketing = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Marketing SET Estatus = 0 WHERE idMarketing = " + idMarketing.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}

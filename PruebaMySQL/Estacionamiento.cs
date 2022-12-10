﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Estacionamiento : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Estacionamiento()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Estacionamiento";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Estacionamiento");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Estacionamiento"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            EquipoInformatico env = new EquipoInformatico();
            env.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            FacturaCliente fac = new FacturaCliente();
            fac.Show();
        }

        private void Estacionamiento_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string lugar = textBox1.Text;
            string tipo = textBox2.Text;
            consulta = "INSERT INTO Estacionamiento (lugar, tipo) values('" + lugar + "', '" + tipo + "', '" +  "')";
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
            string lugar = textBox1.Text;
            string tipo = textBox2.Text;
            int idEstacionamiento = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Estacionamiento SET lugar = '" + lugar + "',tipo = '" + tipo +  "' WHERE idEstacionamiento = " + idEstacionamiento.ToString();
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
int idEstacionamiento = (int) dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Estacionamiento SET Estatus = 0 WHERE idEstacionamiento = " + idEstacionamiento.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}

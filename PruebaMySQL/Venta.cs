﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Venta : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Venta()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Supermercado;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Venta";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Venta");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Venta"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Transporte sucu = new Transporte();
            sucu.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            SucursalEmpleado apar = new SucursalEmpleado();
            apar.Show();
        }

        private void Venta_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string fecha = textBox1.Text;
            string cantidad = textBox2.Text;
            consulta = "INSERT INTO Venta (fecha, cantidad) values('" + fecha + "', '" + cantidad +"')";
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
            string fecha = textBox1.Text;
            string cantidad = textBox2.Text;
            int idVenta = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Venta SET fecha = '" + fecha + "',cantidad = '" + cantidad +"' WHERE idVenta = " + idVenta.ToString();
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
            int idVenta = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Venta SET Estatus = 0 WHERE idVenta = " + idVenta.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}

import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import "../components/css/contact.css";
import { Helmet } from "react-helmet";

const Contact = () => {
  const [name, setName] = useState({});
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    subject: "",
    message: "",
  });
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    const fetchGlobalData = async () => {
      try {
        const response = await axios.get(`/public/getGlobalData`);
        setName(response.data);
      } catch (error) {
        console.error("Error fetching data", error);
      }
    };

    fetchGlobalData();
  }, []);

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.id]: e.target.value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post(`/public/sendContact`, formData);
      if (response.status === 200) {
        setShowModal(true);
        setFormData({ name: "", email: "", subject: "", message: "" });
      } else {
        alert("Something went wrong!");
      }
    } catch (error) {
      console.error("Submission error:", error);
      alert("Submission failed. Try again.");
    }
  };

  const closeModal = () => setShowModal(false);

  return (
    <div>
      <Header />
      <Helmet>
        <title>Contact</title>
      </Helmet>

      <div className="box-layout-child bg--light">
        <section className="inner-page-banner bg-common">
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="breadcrumbs-area">
                  <h1>Contact Us</h1>
                  <ul>
                    <li>
                      <a href="/">Home</a>
                    </li>
                    <li>Contact</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>
        {/* Inne Page Banner Area End Here  header-menu menu-layout1 box-layout-child bg--light*/}
        {/* Contact Area Start Here */}
        <section className="contact-wrap-layout1">
            <div className="row gutters-50">
              <div className="col-lg-8">
                <div className="contact-box-layout1">
                  <div className="google-map-area">
                    <iframe
                      className="embed-responsive-item"
                      style={{ width: "100%", height: 450, borderRadius: 4 }}
                      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.7796875835056!2d90.40096871534068!3d23.790858393145534!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c752e948bbef%3A0x163c6b95603ef31c!2sEduzenship!5e0!3m2!1sen!2sbd!4v1644123285284!5m2!1sen!2sbd"
                      allowFullScreen
                      title="map"
                    ></iframe>
                  </div>
                  <div className="contact-way">
                    <div className="contact-list">
                      <h3 className="item-title">Office Address</h3>
                      <p>{name.address}</p>
                    </div>
                    <div className="contact-list">
                      <h3 className="item-title">Phone</h3>
                      <p>
                        {name.whatsApp ? (
                          <>
                            <a
                              href={`https://wa.me/${name.whatsApp}`}
                              target="_blank"
                              rel="noopener noreferrer"
                            >
                              {name.whatsApp}
                            </a>
                            ,{" "}
                            <a
                              href={`https://wa.me/${name.whatsApp}`}
                              target="_blank"
                              rel="noopener noreferrer"
                            >
                              {name.whatsApp}
                            </a>
                            ,{" "}
                            <a
                              href={`https://wa.me/${name.whatsApp}`}
                              target="_blank"
                              rel="noopener noreferrer"
                            >
                              {name.whatsApp}
                            </a>
                          </>
                        ) : (
                          ""
                        )}
                      </p>
                    </div>
                    <div className="contact-list">
                      <h3 className="item-title">Mail Us</h3>
                      <p>
                        <a href={`mailto:${name.email}`}>{name.email}</a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div className="col-lg-4 sidebar-widget-area sidebar-break-md">
                <div className="widget">
                  <div className="section-heading heading-dark">
                    <h3 className="item-heading">FOLLOW ME ON</h3>
                  </div>
                  <div className="widget-follow-us-2">
                    <ul> 
                      <li className="single-item">
                        <a href={`${name.fblink}`} target="_blank">
                          <i className="fab fa-facebook-f" />
                          Visit Pages
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div className="widget">
                  <div className="widget-ad">
                    <a href="#">
                      <img
                        src="img/carousel-2.jpg"
                        alt="Ad"
                        className="img-fluid"
                      />
                    </a>
                  </div>
                </div>
              </div>
            </div>
          
        </section>
        {/* Contact Area End Here */}
      </div>
      <br/>

      <Footer />
    </div>
  );
};

export default Contact;

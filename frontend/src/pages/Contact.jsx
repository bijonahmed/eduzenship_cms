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
      <div className="container py-5 contact-section">
  <div className="text-center mb-5">
    <h6 className="text-primary text-uppercase font-weight-bold">Contact Us</h6>
    <h1 className="display-4">
      <span className="text-primary">Contact</span> For Any Query
    </h1>
  </div>

  <div className="row text-center mb-5">
    <div className="col-md-4 mb-4">
      <div className="p-4 border rounded shadow-sm h-100">
        <h6 className="text-primary font-weight-bold">Email</h6>
        <p className="mb-0"><i className="fa fa-envelope-open mr-2 text-primary"></i>{name.email}</p>
      </div>
    </div>
    <div className="col-md-4 mb-4">
      <div className="p-4 border rounded shadow-sm h-100">
        <h6 className="text-primary font-weight-bold">WhatsApp</h6>
        <p className="mb-0"><i className="fab fa-whatsapp-square mr-2 text-primary"></i>{name.whatsApp}</p>
        <p className="mb-0"><i className="fab fa-whatsapp-square mr-2 text-primary"></i>{name.whatsAppTwo}</p>
        <p className="mb-0"><i className="fab fa-whatsapp-square mr-2 text-primary"></i>{name.whatsAppThree}</p>
      </div>
    </div>
    <div className="col-md-4 mb-4">
      <div className="p-4 border rounded shadow-sm h-100">
        <h6 className="text-primary font-weight-bold">Address</h6>
        <p className="mb-0"><i className="fa fa-map-marker mr-2 text-primary"></i>{name.address}</p>
      </div>
    </div>
  </div>

  <div className="row">
    <div className="col-md-6 mb-4">
      <div className="embed-responsive embed-responsive-4by3 rounded shadow-sm">
        <iframe
          className="embed-responsive-item"
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.7796875835056!2d90.40096871534068!3d23.790858393145534!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c752e948bbef%3A0x163c6b95603ef31c!2sEduzenship!5e0!3m2!1sen!2sbd!4v1644123285284!5m2!1sen!2sbd"
          allowFullScreen
          title="map"
        ></iframe>
      </div>
    </div>
    <div className="col-md-6">
  <form onSubmit={handleSubmit} className="p-4 border rounded shadow-sm bg-white">
    <div className="form-group">
      <label htmlFor="name" className="h5">Your Name</label>
      <input
        type="text"
        className="form-control form-control-lg"
        id="name"
        value={formData.name}
        onChange={handleChange}
        required
      />
    </div>
    <div className="form-group">
      <label htmlFor="email" className="h5">Your Email</label>
      <input
        type="email"
        className="form-control form-control-lg"
        id="email"
        value={formData.email}
        onChange={handleChange}
        required
      />
    </div>
    <div className="form-group">
      <label htmlFor="subject" className="h5">Subject</label>
      <input
        type="text"
        className="form-control form-control-lg"
        id="subject"
        value={formData.subject}
        onChange={handleChange}
      />
    </div>
    <div className="form-group">
      <label htmlFor="message" className="h5">Message</label>
      <textarea
        className="form-control form-control-lg"
        id="message"
        rows="5"
        value={formData.message}
        onChange={handleChange}
      ></textarea>
    </div>
    <button type="submit" className="btn btn-primary btn-lg btn-block font-weight-bold">
      Send Message
    </button>
  </form>
</div>

  </div>

  {showModal && (
    <div
      className="modal show fade d-block"
      tabIndex="-1"
      role="dialog"
      style={{ background: 'rgba(0, 0, 0, 0.5)' }}
    >
      <div className="modal-dialog" role="document">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title">Thank You!</h5>
            <button type="button" className="close" onClick={closeModal}>
              <span>&times;</span>
            </button>
          </div>
          <div className="modal-body">
            <p>Thanks for contacting us. We’ll get back to you soon.</p>
          </div>
          <div className="modal-footer">
            <button className="btn btn-secondary" onClick={closeModal}>
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  )}
</div>



      <Footer />

     
    </div>
  );
};

export default Contact;

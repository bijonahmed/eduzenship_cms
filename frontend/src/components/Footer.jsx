import React, { useState, useEffect, useContext } from "react";
import { Link } from "react-router-dom";
import { LanguageContext } from "../context/LanguageContext";
import axios from "/config/axiosConfig";

const Footer = () => {
  const { content } = useContext(LanguageContext);
  const [name, setName] = useState("");

  const fetechGlobalData = async () => {
    try {
      const response = await axios.get(`/public/getGlobalData`);
      setName(response.data);
    } catch (error) {
      console.error("Error fetching data", error);
    }
  };

  useEffect(() => {
    fetechGlobalData();
  }, []);

  const currentYear = new Date().getFullYear();

  return (
    <>
      <footer
        className="footer-wrap-layout1"
        style={{
          backgroundColor: "#111",
          color: "#fff",
          padding: "40px 0",
          textAlign: "center",
        }}
      >
        <div className="container">
  <div className="row d-flex justify-content-center align-items-center">
    {/* Center - Logo + Copyright */}
    <div className="col-lg-6 text-center">
      <div
        className="footer-box-layout1"
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          textAlign: "center", // Ensures text is centered
        }}
      >
        <div className="footer-logo" style={{ marginBottom: "15px" }}>
          <Link to="/">
            <img
              src="/img/main-logo.png"
              alt="logo"
              style={{ width: "140px", height: "auto" }}
            />
          </Link>
        </div>
        <div
          className="copyright"
          style={{ fontSize: "14px", color: "#aaa" }}
        >
          © {new Date().getFullYear()} eduzenship. All Rights Reserved.
        </div>
      </div>
    </div>

    {/* Social Icons and WhatsApp */}
    <div className="col-lg-6 text-center">
      <div className="footer-social">
        <ul
          className="footer-social-list"
          style={{
            listStyle: "none",
            padding: 0,
            display: "flex",
            justifyContent: "center",
            gap: "15px",
            margin: "20px 0",
          }}
        >
          <li>
            <a
              href="https://www.facebook.com/eduzenship.bd/"
              target="_blank"
              style={{ color: "#fff", fontSize: "18px" }}
            >
              <i className="fab fa-facebook-f" />
            </a>
          </li>
          <li>
            <a
              href="https://www.instagram.com/eduzenship.bd/"
              target="_blank"
              style={{ color: "#fff", fontSize: "18px" }}
            >
              <i className="fab fa-instagram" />
            </a>
          </li>
        </ul>

        <div style={{ color: "#fff", fontSize: "16px" }}>
          <span style={{ display: "block" }}>
            <a
              href={`https://wa.me/${name.whatsApp}`}
              target="_blank"
              style={{ color: "#fff", textDecoration: "none" }}
            >
              <p className="mb-0">
                <i className="fab fa-whatsapp-square mr-2 text-primary"></i>
                {name.whatsApp}
              </p>
            </a>
          </span>
          <span style={{ display: "block" }}>
            <a
              href={`https://wa.me/${name.whatsAppTwo}`}
              target="_blank"
              style={{ color: "#fff", textDecoration: "none" }}
            >
              <p className="mb-0">
                <i className="fab fa-whatsapp-square mr-2 text-primary"></i>
                {name.whatsAppTwo}
              </p>
            </a>
          </span>
          <span style={{ display: "block" }}>
            <a
              href={`https://wa.me/${name.whatsAppThree}`}
              target="_blank"
              style={{ color: "#fff", textDecoration: "none" }}
            >
              <p className="mb-0">
                <i className="fab fa-whatsapp-square mr-2 text-primary"></i>
                {name.whatsAppThree}
              </p>
            </a>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>

      </footer>
    </>
  );
};

export default Footer;

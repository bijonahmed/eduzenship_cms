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
  style={{
    backgroundColor: "#000",
    padding: "40px 0",
    color: "#fff",
    width: "100%",
  }}
>
  <div
    style={{
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      flexWrap: "wrap",
      maxWidth: "1200px",
      margin: "0 auto",
      padding: "0 20px",
    }}
  >
    {/* Left: Copyright */}
    <div style={{ flex: "1", textAlign: "left", fontSize: "14px" }}>
      © {new Date().getFullYear()} Eduzenship. All Rights Reserved.
    </div>

    {/* Center: Logo */}
    <div style={{ flex: "1", textAlign: "center" }}>
      <Link to="/">
        <img
          src="/img/main-logo.png"
          alt="Eduzenship Logo"
          style={{ height: "60px" }}
        />
      </Link>
    </div>

    {/* Right: Menu and Social */}
    <div
      style={{
        flex: "1",
        textAlign: "right",
        display: "flex",
        justifyContent: "flex-end",
        alignItems: "center",
        gap: "20px",
        flexWrap: "wrap",
      }}
    >
      {/* Inline Menu */}
      <Link to="/" style={{ color: "#fff", textDecoration: "none" }}>
        Home
      </Link>
      <Link to="/about" style={{ color: "#fff", textDecoration: "none" }}>
        About
      </Link>
      <Link to="/courses" style={{ color: "#fff", textDecoration: "none" }}>
        Courses
      </Link>
      <Link to="/blog" style={{ color: "#fff", textDecoration: "none" }}>
        Blog
      </Link>
      <Link to="/contact" style={{ color: "#fff", textDecoration: "none" }}>
        Contact
      </Link>

      {/* Social Icon */}
      <a
        href="#"
        style={{ color: "#fff", fontSize: "16px", textDecoration: "none" }}
      >
        <i className="fab fa-facebook-f"></i>
      </a>
    </div>
  </div>
</footer>

    </>
  );
};

export default Footer;

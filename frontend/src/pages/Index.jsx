import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import BlogContent from "../components/BlogContent";
import Swal from "sweetalert2";
import { Helmet } from "react-helmet";
import "../components/css/sliders.css";

import OwlCarousel from "react-owl-carousel";
import "owl.carousel/dist/assets/owl.carousel.css";
import "owl.carousel/dist/assets/owl.theme.default.css";

const options = {
  loop: true,
  margin: 30,
  nav: true,
  autoplay: true,
  autoplayTimeout: 5000,
  smartSpeed: 2000,
  dots: false,
  responsive: {
    0: { items: 1 },
    576: { items: 1 },
    768: { items: 1 },
    992: { items: 1 },
    1200: { items: 1 },
  },
};

const Index = () => {
  const [slides, setSlides] = useState([]);
  const [isLoaded, setIsLoaded] = useState(false);

  const fetchSliders = async () => {
    try {
      const response = await axios.get("/public/getSliders");
      if (Array.isArray(response.data.data)) {
        setSlides(response.data.data);
        setIsLoaded(true);
      } else {
        console.warn("Invalid slider data:", response.data);
        setSlides([]);
      }
    } catch (error) {
      console.error("Error fetching sliders:", error);
    }
  };

  useEffect(() => {
    fetchSliders();
  }, []);

  return (
    <div>
      <Helmet>
        <title>Welcome to eduzenship</title>
      </Helmet>
      {/* START */}
      <div>
        {/* ScrollUp Start Here */}
        <a href="#wrapper" data-type="section-switch" className="scrollup">
          <i className="fas fa-angle-double-up" />
        </a>
        {/* Preloader End Here */}
        <div id="wrapper" className="wrapper">
          <Header />
          <div className="box-layout-child bg-white">
            {/* Slider Area Start Here */}
            <section className="slider-wrap-layout1">
              <div className="container slider-container">
                {!isLoaded && <div className="slider-loading">Loading...</div>}

                {isLoaded && (
                  <OwlCarousel className="owl-theme" {...options}>
                    {slides.map((slide, idx) => (
                      <div className="slider-box-layout1" key={idx}>
                        <div className="item-img">
                          <img
                            src={slide.sliderImage}
                            alt="slider"
                            className="slider-image"
                          />
                        </div>
                        <div className="item-content">
                          <h2 className="item-title">
                            <a href="#">{slide.title_name}</a>
                          </h2>
                        </div>
                      </div>
                    ))}
                  </OwlCarousel>
                )}
              </div>
            </section>

            {/* Slider Area End Here */}
            <BlogContent />
          </div>
          {/* Footer Area Start Here */}
          <Footer />
         
        </div>
      </div>
      {/* END */}
    </div>

  );
};

export default Index;

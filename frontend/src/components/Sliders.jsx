import React, { useState, useEffect } from "react";
import axios from "/config/axiosConfig";
import "../components/css/Sliders.css"; // Custom styles below

const Sliders = () => {
  const [slides, setSlides] = useState([]);
  const [currentIndex, setCurrentIndex] = useState(0);

  useEffect(() => {
    const fetchSliderData = async () => {
      try {
        const response = await axios.get(`/public/getSliderData`);
        if (Array.isArray(response.data.data)) {
          setSlides(response.data.data);
        } else {
          console.warn("Unexpected slider data:", response.data);
          setSlides([]);
        }
      } catch (error) {
        console.error("Failed to fetch slider data", error);
      }
    };

    fetchSliderData();
  }, []);

  useEffect(() => {
    if (slides.length === 0) return;

    const timer = setInterval(() => {
      setCurrentIndex((prev) => (prev + 1) % slides.length);
    }, 5000); // change every 5 seconds

    return () => clearInterval(timer);
  }, [slides.length]);

  if (!slides.length) return null;

  return (
    <section className="custom-slider-wrapper">
      <div className="custom-slider">
        {slides.map((slide, index) => (
          <div
            key={index}
            className={`custom-slide ${index === currentIndex ? "active" : ""}`}
          >
            <img src={slide.image} alt={`Slide ${index + 1}`} />
          </div>
        ))}

        <button
          className="slider-control prev"
          onClick={() =>
            setCurrentIndex((prev) =>
              prev === 0 ? slides.length - 1 : prev - 1
            )
          }
        >
          ❮
        </button>
        <button
          className="slider-control next"
          onClick={() =>
            setCurrentIndex((prev) => (prev + 1) % slides.length)
          }
        >
          ❯
        </button>
      </div>
    </section>
  );
};

export default Sliders;

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
     <>
       <section className="slider-wrap-layout1">
              <div className="container">
                <div
                  className="rc-carousel nav-control-layout1"
                  data-loop="true"
                  data-items={30}
                  data-margin={30}
                  data-autoplay="true"
                  data-autoplay-timeout={5000}
                  data-smart-speed={2000}
                  data-dots="false"
                  data-nav="true"
                  data-nav-speed="false"
                  data-r-x-small={1}
                  data-r-x-small-nav="true"
                  data-r-x-small-dots="false"
                  data-r-x-medium={1}
                  data-r-x-medium-nav="true"
                  data-r-x-medium-dots="false"
                  data-r-small={1}
                  data-r-small-nav="true"
                  data-r-small-dots="false"
                  data-r-medium={1}
                  data-r-medium-nav="true"
                  data-r-medium-dots="false"
                  data-r-large={1}
                  data-r-large-nav="true"
                  data-r-large-dots="false"
                  data-r-extra-large={1}
                  data-r-extra-large-nav="true"
                  data-r-extra-large-dots="false"
                >
                  <div className="slider-box-layout1">
                    <div className="item-img">
                      <img src="/img/slider/slide1-1.jpg" alt="slider" />
                    </div>
                    <div className="item-content">
                      <ul className="entry-meta meta-color-dark">
                        <li>
                          <i className="fas fa-tag" />
                          Fashion-1
                        </li>
                        <li>
                          <i className="fas fa-calendar-alt" />
                          Jan 19, 2019
                        </li>
                        <li>
                          <i className="fas fa-user" />
                          BY <a href="#">Mark Willy</a>
                        </li>
                        <li>
                          <i className="far fa-clock" />5 Mins Read
                        </li>
                      </ul>
                      <h2 className="item-title">
                        <a href="single-blog.html">
                          Business Partners Work at Office 2019
                        </a>
                      </h2>
                    </div>
                  </div>
                  <div className="slider-box-layout1">
                    <div className="item-img">
                      <img src="/img/slider/slide1-1.jpg" alt="slider" />
                      <div className="item-content">
                        <ul className="entry-meta meta-color-dark">
                          <li>
                            <i className="fas fa-tag" />
                            Fashion-2
                          </li>
                          <li>
                            <i className="fas fa-calendar-alt" />
                            Jan 19, 2019
                          </li>
                          <li>
                            <i className="fas fa-user" />
                            BY <a href="#">Mark Willy</a>
                          </li>
                          <li>
                            <i className="far fa-clock" />5 Mins Read
                          </li>
                        </ul>
                        <h2 className="item-title">
                          <a href="single-blog.html">
                            Business Partners Work at Office 2019
                          </a>
                        </h2>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>
     </>
  );
};

export default Sliders;

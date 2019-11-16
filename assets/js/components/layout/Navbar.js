import React from "react";
import PropTypes from "prop-types";
import { Link } from "react-router-dom";

import "../../../css/plugin-min.css";
import "../../../css/custom-min.css";

const Navbar = ({ icon, title }) => {
  return (
    <div className="navbar-fixed">
      <nav id="nav_f" className="default_color" role="navigation">
        <div className="container">
          <div className="nav-wrapper">
            <Link to="/" id="logo-container" className="brand-logo">
              Team1
            </Link>
            <ul className="right hide-on-med-and-down">
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/services">Services</Link>
              </li>
              <li>
                <Link to="/">Cotact</Link>
              </li>
              <li>
                <Link to="/">Log In</Link>
              </li>
              <li>
                <Link to="/">Register</Link>
              </li>
            </ul>
            <ul id="nav-mobile" className="side-nav">
              <li>
                <Link to="/services">Services</Link>
              </li>
              <li>
                <Link to="/">Cotact</Link>
              </li>
              <li>
                <Link to="/">Log In</Link>
              </li>
              <li>
                <Link to="/">Register</Link>
              </li>
            </ul>
            <a href="#" data-activates="nav-mobile" className="button-collapse">
              <i className="mdi-navigation-menu"></i>
            </a>
          </div>
        </div>
      </nav>
    </div>
  );
};

export default Navbar;

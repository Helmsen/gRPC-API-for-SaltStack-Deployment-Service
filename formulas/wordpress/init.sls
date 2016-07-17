include:
  {% if grains['os'] == 'Ubuntu' %}
  - fapra/formulas/wordpress/wordpress_ubuntu
  {% elif grains['os'] == 'Amazon' %}
  - fapra/formulas/wordpress/wordpress_amazon
  {% endif %}


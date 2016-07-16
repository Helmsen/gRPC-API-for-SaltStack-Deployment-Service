include:
  {% if grains['os'] == 'Ubuntu' %}
  - wordpress/wordpress_ubuntu
  {% elif grains['os'] == 'Amazon' %}
  - wordpress/wordpress_amazon
  {% endif %}


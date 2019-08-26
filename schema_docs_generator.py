import json
from mdutils.mdutils import MdUtils

schema = json.load(open('bigquery_schema.json'))

md = MdUtils(file_name='README.md', title='Parcel Standard Schema v1.0.0')

md.new_paragraph(
    'This repository contains tools and documents to help you get the most of '
    'your [Land Record](http://www.landrecord.us) parcel dataset.')

md.new_header(level=1, title='Technical Notes')
md.new_paragraph(
    'An individual county or state can easily be stored and analyzed in a '
    'traditional OLTP database such as PostgreSQL (with the PostGIS extension). '
    'For a multi-state or national parcel datastore, we strongly recommend '
    'utilizing a scalable cloud-based datastore such as BigQuery. For '
    'convenience, this repository includes a BigQuery JSON schema file.')

md.new_header(level=1, title='Schema Definition')

table_fields = [field[attr] for field in schema for attr in field]
table_fields = [ 'Column', 'Type', 'Constraints', 'Description' ] + table_fields

md.new_table(columns=4, rows=len(schema) + 1, text=table_fields, text_align='left')

md.new_header(level=1, title='Versioning')

md.new_paragraph(
    'This standard uses semantic versioning; as such, no breaking changes will '
    'occur within major version releases. In other words, all 1.x.x releases '
    'will be backward-compatible with all other 1.x.x releases.')

md.create_md_file()

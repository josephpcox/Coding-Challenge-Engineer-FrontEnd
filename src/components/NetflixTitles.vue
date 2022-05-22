<template>
<div id="app" class="container">
   <div class="overflow-auto">
  <b-field grouped group-multiline>
    <div v-for="(field, index) in fields"
      :key="index"
      class="control">
      <b-checkbox v-model="field.visible">
        {{ field.title }}
      </b-checkbox>
    </div>
    <br>
        <b-select v-model="perPage" :disabled="!isPaginated">
          <option value="5">5 per page</option>
            <option value="10">10 per page</option>
            <option value="15">15 per page</option>
            <option value="20">20 per page</option>
          </b-select>
            
  </b-field>
    <b-table  
      id="my-table"
      :data="data"
      :paginated="isPaginated"
      :per-page="perPage"
      :columns="fields"
      :sort-icon="sortIcon"
      size="is-small"
      aria-next-label="Next page"
      aria-previous-label="Previous page"
    >
  
    </b-table>
  </div>
</div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'NetflixTitles',
  data() {
    return {
      fields: [
         {
            field: 'show_id',
            title: 'Show ID',
            label:'Show ID',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'type',
            title: 'Type',
            label: 'Type',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'title',
            title: 'Title',
            label:'Title',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'director',
            title: 'Director',
            label: 'Director',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'country',
            title: 'Country',
            label: 'Country',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'duration',
            title: 'Duration',
            label: 'Duration',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'listed_in',
            title: 'Listed In',
            label: 'Listed In',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'release_year',
            title: 'Release Year',
            label: 'Release Year',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
          {
            field: 'rating',
            title: 'Rating',
            label: 'Rating',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          }
        ],
      data: [],
      dataKey: 0,
      isPaginated: true,
      paginationPosition: 'both',
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 20,
      search: '',
      classNumber: '',
      isLoading: true,
      isFullPage: true,
      sortIcon: 'arrow-up',
      sortIconSize: 'is-small',
      excelExport: [],
    };
  },
  computed: {
    rows() {
        return this.data.length
    }
  },
  mounted() {
    this.getTitles();
  },
  methods: {
    async getTitles() {
      this.isLoading = true;
      const path = 'http://34.73.22.157/api/netflix_titles/get_all';
      const { data } = await axios.get(path);
      this.data = data;
      console.log('netflix titles',this.data);
      this.isLoading = false;
      console.log('hi');
    },
  },
};
</script>

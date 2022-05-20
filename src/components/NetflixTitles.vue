<template>
   <div class="overflow-auto">
     <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="my-table"
    ></b-pagination>
    
    <b-form-input
      v-model="search"
      class="input column-filter"
      type="text" placeholder="Filter By Title"
    />
    <b-table hover 
      id="my-table"
      :busy="isLoading"
      :items="filteredTitles"
      :fields="fields"
      :per-page="perPage"
      :current-page="currentPage"
      small
    >
    <template #table-busy>
        <div class="text-center text-primary my-2">
          <b-spinner variant="primary" class="align-middle"></b-spinner>
          <strong>Loading Titles...</strong>
        </div>
      </template>
    </b-table>
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
            key: 'title',
            label: 'Title',
            sortable: true
          },
          {
            key: 'type',
            label: 'Type',
            sortable: true
          },
          {
            key: 'director',
            label: 'Director',
            sortable: true,
          },
          {
            key: 'rating',
            label: 'Rating',
            sortable: true
          }
        ],
      items: [],
      dataKey: 0,
      isPaginated: true,
      paginationPosition: 'both',
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 50,
      search: '',
      classNumber: '',
      isLoading: true,
      isFullPage: true,
      excelExport: [],
    };
  },
  computed: {
    filteredTitles() {
      return this.items.filter(item => item.title
        .toLowerCase().includes(this.search.toLowerCase()));
    },
    rows() {
        return this.items.length
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
      this.items = data;
      console.log('netflix titles',this.items);
      console.log('first element', this.items);
      this.isLoading = false;
    },
  },
};
</script>

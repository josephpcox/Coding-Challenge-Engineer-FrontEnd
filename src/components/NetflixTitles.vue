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
     <div v-if="!selected">
       <b-button :disabled="true" type="is-primary is-light">Edit</b-button>
       <b-button :disabled="true" type="is-danger is-light">Delete</b-button>
       <b-button :disabled="true" type="is-info is-light">Unselect</b-button>
       <p>Select a row in the table to activate buttons</p>
     </div>
     <div v-else>
      <b-button @click="edit" type="is-primary">Edit</b-button>
      <b-button @click="remove" type="is-danger">Delete</b-button>
      <b-button @click="unselect" type="is-info">Unselect</b-button>
    </div>   
    <b-table  
      id="my-table"
      :data="data"
      :loading="isLoading"
      :focusable="isFocusable"
      :paginated="isPaginated"
      :pagination-size= "paginationSize"
      :pagination-rounded="isPaginationRounded"
      :mobile-cards="hasMobileCards"
      :pagination-position="paginationPosition"
      :per-page="perPage"
      :columns="fields"
      :sort-icon="sortIcon"
      :size="size"
      aria-next-label="Next page"
      aria-previous-label="Previous page"
      :hoverable="isHoverable"
      :scrollable="isScrollable"
      :selected.sync="selected"
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
          },
          {
            field: 'cast',
            title: 'Cast',
            label: 'Cast',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:false,
            width: '100',
            centered: true,
          },
        ],
      data: [],
      hasMobileCards:true,
      sortIcon: "arrow-up",
      dataKey: 0,
      isPaginated: true,
      isHoverable: true,
      isScrollable: true,
      isPaginationRounded:false,
      paginationPosition: 'both',
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 20,
      search: '',
      isFocusable: false,
      classNumber: '',
      isLoading: true,
      isFullPage: true,
      sortIconSize: 'is-small',
      size:'is-small',
      excelExport: [],
      selected: null,
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
    edit() {
      console.log('This is where we edit'+ this.selected);
    },
    remove() {
      console.log('This is where we delete' + this.selected);
    },
    unselect() {
      console.log('This is where we unselect' + this.selected);
      this.selected = null;
    }
  },
};
</script>

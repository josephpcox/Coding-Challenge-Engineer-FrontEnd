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
     <div class= "buttons" v-if="!selected">
       <b-button @click="create()" type="is-success">Create</b-button>
       <b-button :disabled="true" type="is-primary is-light">Edit</b-button>
       <b-button :disabled="true" type="is-info is-light">Unselect</b-button>
     </div>
     <div class="buttons" v-else>
       <b-button @click="create()" type="is-success">Create</b-button>
      <b-button @click="edit(selected)" type="is-primary">Edit</b-button>
      <b-button @click="unselect()" type="is-info">Unselect</b-button>
    </div>
    <b-table  
      id="my-table"
      :data="data"
      :loading="isLoading"
      :focusable="isFocusable"
      :paginated="isPaginated"
      :pagination-size= "size"
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
  <section>
        <b-modal :active.sync="isComponentModalActive" has-modal-card>
            <form action="">
            <div class="modal-card" style="width: 800px">
                <header class="modal-card-head">
                    <p class="modal-card-title">Edit Title</p>
                </header>
                <section class="modal-card-body">
                    <b-field label="show id">
                        <b-input
                            type="text"
                            v-model="formProps.show_id"
                            placeholder="show id"
                            required>
                        </b-input>
                    </b-field>
                    <b-field label="Type">
                        <b-input
                            type="text"
                            v-model="formProps.type"
                            placeholder="Show/Movie Type">
                        </b-input>
                    </b-field>
                    <b-field label="Title">
                        <b-input
                            type="text"
                            v-model="formProps.title"
                            placeholder="Show/Movie Title"
                            required>
                        </b-input>
                    </b-field>
                    <b-field label="Director">
                        <b-input
                            type="text"
                            v-model="formProps.director"
                            placeholder="Show/Movie Director">
                        </b-input>
                    </b-field>
                    <b-field label="Country">
                        <b-input
                            type="text"
                            v-model="formProps.country"
                            placeholder="Show/Movie Country">
                        </b-input>
                    </b-field>
                    <b-field label="Duration">
                        <b-input
                            type="text"
                            v-model="formProps.duration"
                            placeholder="Show/Movie Duration">
                        </b-input>
                    </b-field>
                    <b-field label="Listed In">
                        <b-input
                            type="text"
                            v-model="formProps.listed_in"
                            placeholder="Show/Movie Listed In">
                        </b-input>
                    </b-field>
                    <b-field label="Release Year">
                        <b-input
                            type="text"
                            v-model="formProps.release_year"
                            placeholder="Show/Movie Release Year">
                        </b-input>
                    </b-field>
                    <b-field label="Rating">
                        <b-input
                            type="text"
                            v-model="formProps.rating"
                            placeholder="Show/Movie Rating">
                        </b-input>
                    </b-field>
                    <b-field label="Cast">
                        <b-input
                            type="textarea"
                            v-model="formProps.cast"
                            placeholder="Show/Movie Cast">
                        </b-input>
                    </b-field>
                </section>
                <footer class="modal-card-foot">
                    <button class="button" type="button" @click="close()">Cancel</button>
                    <button v-if="isCreate" class="button is-success" type="button" @click="save()"> Save </button>
                    <button v-if="!isCreate" class="button is-success" type="button" @click="update()">Update</button>
                    <button v-if="!isCreate" class="button is-danger" @click="remove()">Delete</button>
                </footer>
            </div>
        </form>
        </b-modal>
    </section>
</div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'NetflixTitles',
  components: {
  },
  data() {
    return {
      fields: [
        {
            field: 'id',
            title: 'ID',
            label:'ID',
            sortable: true,
            searchable: true,
            numeric: false,
            visible:true,
            width: '100',
            centered: true,
          },
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
      isComponentModalActive:false,
      hasMobileCards:true,
      sortIcon: "arrow-up",
      isPaginated: true,
      isHoverable: true,
      isScrollable: true,
      isPaginationRounded:false,
      paginationPosition: 'both',
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 20,
      isFocusable: false,
      isLoading: true,
      isFullPage: true,
      sortIconSize: 'is-small',
      size:'is-small',
      excelExport: [],
      selected: null,
      isCreate: false,
      formProps:{
        id:'',
        cast: '',
        country: '',
        date_added: '',
        description: '',
        director: '',
        duration: '',
        listed_in: '',
        rating: '',
        release_year: '',
        show_id: '',
        title: '',
        type: '',
      },
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
      const { data } = await axios.get(path).catch((error) => {
        console.log(error);
      });
      this.data = data;
      console.log('netflix titles',this.data);
      this.isLoading = false;
    },
    edit(selected) {
      this.isCreate = false;
      this.isComponentModalActive = true;
      console.log('This is where we edit'+ JSON.stringify(selected));
      this.formProps = JSON.parse(JSON.stringify(selected));
    },
    create(){
      this.isCreate = true;
      this.formProps = {
        cast: '',
        country: '',
        date_added: '',
        description: '',
        director: '',
        duration: '',
        listed_in: '',
        rating: '',
        release_year: '',
        show_id: '',
        title: '',
        type: '',
      },
      this.isComponentModalActive = true;
    },
    async remove() {
      const path = `http://34.73.22.157/api/netflix_titles/delete_title/${this.formProps.id}`;
      const status = await axios.delete(path).catch((error) => {
        console.log(error);
      });
      this.data = [];
      this.getTitles();
      // this.close();
      console.log(status);
    },
    unselect() {
      this.selected = null;
    },
    async save() {
      const path = 'http://34.73.22.157/api/netflix_titles/create_title/';
      const status = await axios.post(path, this.formProps).catch((error) => {
        console.log(error);
      });
      this.data = [];
      this.getTitles();
      this.close();
      console.log(status);
    },
    async update () {
      const path = 'http://34.73.22.157/api/netflix_titles/update_title/';
      await axios.put(path, this.formProps).catch((error) => {
        console.log(error);
      });
      this.data = [];
      this.getTitles();
      this.close();
    },
    close(){
      this.isComponentModalActive = false;
    },
  },
};
</script>
